require 'minitest/autorun'
require_relative '../lib/quicksort'
require_relative 'test_helper'

class QuicksortTest < Minitest::Test
  extend TestHelper
  include Quicksort

  add_all_base_tests Quicksort
end