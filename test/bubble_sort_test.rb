require 'minitest/autorun'
require_relative '../lib/bubble_sort'
require_relative 'test_helper'

class BubbleSortTest < Minitest::Test
  extend TestHelper
  include BubbleSort

  add_all_base_tests
end