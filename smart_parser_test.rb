require 'minitest/autorun'
require_relative 'smart_parser.rb'


class SmartParserCountTest < Minitest::Test
  def setup
    @smart_parser = SmartParser.new.parse_file('sample_log.log')
  end

  def test_overall_totals
    counts = ["about", 6]
    assert_includes @smart_parser[0], counts
  end

  def test_unique_totals
    count1 = ["/about/2", 4]
    count2 = ["/about", 2]
    assert_includes @smart_parser[1], count1
    assert_includes @smart_parser[1], count2
  end

  def test_overall_max_and_min
    max = ["about", 6]
    min = ["index", 1]
    assert_equal @smart_parser[0].first, max
    assert_equal @smart_parser[0].last, min
  end

  def test_unique_max_and_min
    max = ["/help_page/1", 5]
    min = ["/index", 1]
    assert_equal @smart_parser[1].first, max
    assert_equal @smart_parser[1].last, min
  end
end