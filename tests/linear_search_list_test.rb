require 'minitest/autorun'
require_relative '../linear_search_list'

class TestLinearSearchList < Minitest::Test
  def test_true_if_needle_in_haystack
    arr = [1, 3, 4, 69, 71, 81, 90, 99, 420, 1337, 69_420]

    assert_equal(linear_search(arr, 69), true)
    assert_equal(linear_search(arr, 1), true)
    assert_equal(linear_search(arr, 69_420), true)
    assert_equal(linear_search(arr, 0), false)
    assert_equal(linear_search(arr, 2), false)
  end
end
