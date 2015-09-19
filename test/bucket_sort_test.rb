require 'minitest/autorun'
require_relative '../lib/bucket_sort'
require_relative 'test_helper'

class BucketSortTest < Minitest::Test
  extend TestHelper
  include BucketSort

  data_dir = File.dirname(__FILE__) + '/data'
  integerTests = JSON.parse(File.read("#{data_dir}/integer-tests.json"))
  integerTests.each do |test|
    if not test['sorted'].empty? and test['sorted'].first >= 0
      define_method("test_integer_#{test["it"].gsub(" ", "_")}") do
        assert_sort_test(BucketSort, test)
      end
    end
  end

  integerTests = JSON.parse(File.read("#{data_dir}/integer-tests.json"))
  integerTests.each do |test|
    if not test['sorted'].empty? and test['sorted'].first >= 0
      define_method("test_integer_bucket_size_1_#{test["it"].gsub(" ", "_")}") do
        assert_sort_test(BucketSort, test, 1)
      end
    end
  end

  integerTests = JSON.parse(File.read("#{data_dir}/integer-tests.json"))
  integerTests.each do |test|
    if not test['sorted'].empty? and test['sorted'].first >= 0
      define_method("test_integer_bucket_size_10_#{test["it"].gsub(" ", "_")}") do
        assert_sort_test(BucketSort, test, 10)
      end
    end
  end
end