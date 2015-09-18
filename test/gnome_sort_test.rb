require 'minitest/autorun'
require_relative '../lib/gnome_sort'
require_relative 'test_helper'

class GnomeSortTest < Minitest::Test
  extend TestHelper
  include GnomeSort

  add_all_base_tests
end