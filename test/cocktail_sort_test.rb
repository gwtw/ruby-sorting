require 'minitest/autorun'
require_relative '../lib/cocktail_sort'
require_relative 'test_helper'

class CocktailSortTest < Minitest::Test
  extend TestHelper
  include CocktailSort

  add_all_base_tests CocktailSort
end