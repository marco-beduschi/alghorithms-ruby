require 'minitest/autorun'
require_relative '../test_helpers/tree_helper'

class BTInOrderTest < Minitest::Test
  def test_in_order
    # Assuming there's a binary tree in-order traversal implementation to require
    # require_relative '../bt_in_order'

    tree = TreeHelper.tree
    
    # For now using a mock in-order traversal function
    expected = [5, 7, 10, 15, 20, 29, 30, 45, 50, 100]
    assert_equal expected, bt_in_order_mock(tree)
  end

  private

  # Mock in-order traversal implementation
  def bt_in_order_mock(root)
    result = []
    in_order_helper(root, result)
    result
  end

  def in_order_helper(node, result)
    return if node.nil?

    in_order_helper(node.left, result)
    result << node.value
    in_order_helper(node.right, result)
  end
end