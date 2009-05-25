$:.push('lib')
require 'pp'
require 'is_it_one_nine'
REDCODE   = 31
GREENCODE = 32
YELLOWCOE = 33

def check_gem(gem_name)
  iion = IsItOneNine.new(gem_name)
  if iion.success?
    message = "#{gem_name} -- working: #{iion.works} : fails: #{iion.fails} : reported versions #{iion.reported_versions.join(",")}"
    code = (iion.works > iion.fails) ? GREENCODE : REDCODE
  else
    message = "#{gem_name} -- not found"
    code = YELLOWCOE
  end
  puts "\e[#{ code }m#{ message }\e[0m"
end


task :check_all do
  gem_list = `gem list`.inject([]) do |memo,line|
    check_gem(line.split(" ")[0])
  end
end

task :check_gem do
  check_gem(ENV['gem_name'] || ENV['GEM_NAME'])  
end