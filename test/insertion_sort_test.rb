require 'minitest/autorun'
require 'json'
require_relative '../lib/insertion_sort'
require_relative 'base_sorting_test'

class InsertionSortTest < Minitest::Test
  extend BaseSortingTest
  include InsertionSort

  add_all_base_tests
end