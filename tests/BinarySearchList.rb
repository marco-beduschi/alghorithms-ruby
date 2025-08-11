require 'minitest/autorun'
require_relative '../binary_search'

class BinarySearchListTest < Minitest::Test
  def test_binary_search_array
    # Assuming there's a binary search implementation to require
    # require_relative '../binary_search_list'

    foo = [1, 3, 4, 69, 71, 81, 90, 99, 420, 1337, 69420]
    
    # For now using a mock binary search function
    assert_equal true, binary_search(foo, 69)
    assert_equal false, binary_search(foo, 1336)
    assert_equal true, binary_search(foo, 69420)
    assert_equal false, binary_search(foo, 69421)
    assert_equal true, binary_search(foo, 1)
    assert_equal false, binary_search(foo, 0)
  end
end
