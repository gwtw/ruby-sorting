require 'minitest/autorun'
require_relative '../lib/bubble_sort_optimised'
require_relative 'test_helper'

class BubbleSortOptimisedTest < Minitest::Test
  extend TestHelper
  include BubbleSortOptimised

  add_all_base_tests BubbleSortOptimised
end