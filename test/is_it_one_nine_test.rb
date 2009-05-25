require 'is_it_one_nine'
require 'test/unit'
class IsItOneNineTest < Test::Unit::TestCase
  def test_should_count_ten_fails
    iion = IsItOneNine.new('hpricot')
    assert_equal 10, iion.fails
  end
  
  def test_should_count_sixteen_works
    iion = IsItOneNine.new('hpricot')
    assert_equal 16, iion.works
  end
  
  def test_should_be_successful
    iion = IsItOneNine.new('hpricot')
    assert iion.success?
  end
  
  def test_should_be_unsuccessful
    iion = IsItOneNine.new('asdfasdfsadfasdf')
    assert_equal false,iion.success?
  end
  
  def test_get_reported_versions
    iion = IsItOneNine.new('webrat')
    assert_equal ["0.4.4", "0.4.1"], iion.reported_versions
  end
  
  def test_version_reported
    iion = IsItOneNine.new('webrat')
    assert iion.reported_version?("0.4.4")
  end
  
  def test_no_versions_reported
    iion = IsItOneNine.new('actionmailer')
    assert_equal [], iion.reported_versions
  end
  
  def test_should_not_fail_when_lookup_fails
    iion = IsItOneNine.new('asdfasdfsadfasdf')
    #assert_equal 0, iion.works
    assert_equal 0, iion.fails
  end
  
end