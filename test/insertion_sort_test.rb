require 'minitest/autorun'
require 'json'
require_relative '../lib/insertion_sort'

class InsertionSortTest < Minitest::Test
  include InsertionSort

  @integerTests = JSON.parse(File.read(File.dirname(__FILE__) + '/data/integer-tests.json'))
  @integerTests.each do |test|
    define_method("test_integer_#{test["it"].gsub(" ", "_")}") do
      assert_sort_test(test)
    end
  end

  @integerReverseTests = JSON.parse(File.read(File.dirname(__FILE__) + '/data/integer-reverse-tests.json'))
  @integerReverseTests.each do |test|
    define_method("test_integer_reverse_#{test["it"].gsub(" ", "_")}") do
      assert_sort_test(test, lambda { |a, b| b <=> a })
    end
  end

  @stringTests = JSON.parse(File.read(File.dirname(__FILE__) + '/data/string-tests.json'))
  @stringTests.each do |test|
    define_method("test_string_#{test["it"].gsub(" ", "_")}") do
      assert_sort_test(test, lambda { |a, b| a.casecmp b })
    end
  end

  def assert_sort_test(test, compare = nil)
    result = test['original']
    if compare.nil?
      sort(result)
    else
      sort(result, compare)
    end
    assert_equal test['sorted'], result, test['it']
  end
end