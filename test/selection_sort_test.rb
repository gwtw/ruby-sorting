require 'minitest/autorun'
require_relative '../lib/selection_sort'
require_relative 'test_helper'

class SelectionSortTest < Minitest::Test
  extend TestHelper
  include SelectionSort

  add_all_base_tests SelectionSort
end