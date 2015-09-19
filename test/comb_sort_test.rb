require 'minitest/autorun'
require_relative '../lib/comb_sort'
require_relative 'test_helper'

class CombSortTest < Minitest::Test
  extend TestHelper
  include CombSort

  add_all_base_tests CombSort
end