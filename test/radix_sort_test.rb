require 'minitest/autorun'
require_relative '../lib/radix_sort'
require_relative 'test_helper'

class RadixSortTest < Minitest::Test
  extend TestHelper
  include RadixSort

  data_dir = File.dirname(__FILE__) + '/data'
  integerTests = JSON.parse(File.read("#{data_dir}/integer-tests.json"))
  integerTests.each do |test|
    if not test['sorted'].empty? and test['sorted'].first >= 0
      define_method("test_integer_#{test["it"].gsub(" ", "_")}") do
        assert_sort_test(RadixSort, test, test['sorted'].last)
      end
    end
  end
end
