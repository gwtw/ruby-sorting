require 'minitest/autorun'
require_relative '../lib/heapsort'
require_relative 'test_helper'

class HeapsortTest < Minitest::Test
  extend TestHelper
  include Heapsort

  add_all_base_tests Heapsort
end