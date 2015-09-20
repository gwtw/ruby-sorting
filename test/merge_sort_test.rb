require 'minitest/autorun'
require_relative '../lib/merge_sort'
require_relative 'test_helper'

class MergeSortTest < Minitest::Test
  extend TestHelper
  include MergeSort

  add_all_base_tests MergeSort
end