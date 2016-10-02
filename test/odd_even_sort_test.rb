require 'minitest/autorun'
require_relative '../lib/odd_even_sort'
require_relative 'test_helper'

class OddEvenSortTest < Minitest::Test
  extend TestHelper
  include OddEvenSort

  add_all_base_tests OddEvenSort
end
