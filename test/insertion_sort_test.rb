require 'minitest/autorun'
require_relative '../lib/insertion_sort'
require_relative 'test_helper'

class InsertionSortTest < Minitest::Test
  extend TestHelper
  include InsertionSort

  add_all_base_tests
end