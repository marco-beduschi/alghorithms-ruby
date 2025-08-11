require 'minitest/autorun'
require_relative '../linear_search_list'

class LinearSearchListTest < Minitest::Test
  def test_linear_search_array
    # Assuming there's a linear search implementation to require
    # require_relative '../linear_search_list'

    foo = [1, 3, 4, 69, 71, 81, 90, 99, 420, 1337, 69420]

    # For now using a mock linear search function
    assert_equal true, linear_search(foo, 69)
    assert_equal false, linear_search(foo, 1336)
    assert_equal true, linear_search(foo, 69420)
    assert_equal false, linear_search(foo, 69421)
    assert_equal true, linear_search(foo, 1)
    assert_equal false, linear_search(foo, 0)
  end
end
