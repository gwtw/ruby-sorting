require 'minitest/autorun'
require_relative '../lib/counting_sort'
require_relative 'test_helper'

class CountingSortTest < Minitest::Test
  extend TestHelper
  include CountingSort

  data_dir = File.dirname(__FILE__) + '/data'
  integerTests = JSON.parse(File.read("#{data_dir}/integer-tests.json"))
  integerTests.each do |test|
    if not test['sorted'].empty? and test['sorted'].first >= 0
      define_method("test_integer_#{test["it"].gsub(" ", "_")}") do
        assert_sort_test(CountingSort, test, test['sorted'].last)
      end
    end
  end
end