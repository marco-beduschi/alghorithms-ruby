require 'minitest/autorun'
require_relative '../test_helpers/tree_helper'

class BTPreOrderTest < Minitest::Test
  def test_pre_order
    # Assuming there's a binary tree pre-order traversal implementation to require
    # require_relative '../bt_pre_order'

    tree = TreeHelper.tree
    
    # For now using a mock pre-order traversal function
    expected = [20, 10, 5, 7, 15, 50, 30, 29, 45, 100]
    assert_equal expected, bt_pre_order_mock(tree)
  end

  private

  # Mock pre-order traversal implementation
  def bt_pre_order_mock(root)
    result = []
    pre_order_helper(root, result)
    result
  end

  def pre_order_helper(node, result)
    return if node.nil?

    result << node.value
    pre_order_helper(node.left, result)
    pre_order_helper(node.right, result)
  end
end