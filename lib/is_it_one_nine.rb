require 'rubygems'
require 'open-uri'
require 'nokogiri'


class IsItOneNine
  
  def initialize(gem_name)
    @gem_name = gem_name
    @success = true
    begin
      @doc = Nokogiri::HTML(open("http://isitruby19.com/#{@gem_name}"))
    rescue OpenURI::HTTPError => e
      @success = false
    end
  end
  
  def success?
    @success
  end
  
  def fails
    @fails = 0
    @fails = @doc.css('span.fails').length unless @doc.nil?
    @fails
  end
  
  def works
    @works = 0
    @works = @doc.css('span.works').length unless @doc.nil?
    @works
  end
  
  def reported_versions
    @reported_versions ||= @doc.css('p.status').map do |p|
      md = p.inner_html.match(/\((((\d+\.)\d+\.)?\d+)?\)/)
      md[1] unless md.nil?
    end
    @reported_versions.delete_if{|x| x.nil?}
  end
  
  def reported_version?(version)
    reported_versions.include?(version)
  end
end

