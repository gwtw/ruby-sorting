require 'minitest/autorun'
require_relative '../lib/merge_sort_bottom_up'
require_relative 'test_helper'

class MergeSortBottomUpTest < Minitest::Test
  extend TestHelper
  include MergeSortBottomUp

  add_all_base_tests MergeSortBottomUp
end