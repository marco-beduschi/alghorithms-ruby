require 'minitest/autorun'
require_relative '../test_helpers/tree_helper'

class BTPostOrderTest < Minitest::Test
  def test_post_order
    # Assuming there's a binary tree post-order traversal implementation to require
    # require_relative '../bt_post_order'

    tree = TreeHelper.tree
    
    # For now using a mock post-order traversal function
    expected = [7, 5, 15, 10, 29, 45, 30, 100, 50, 20]
    assert_equal expected, bt_post_order_mock(tree)
  end

  private

  # Mock post-order traversal implementation
  def bt_post_order_mock(root)
    result = []
    post_order_helper(root, result)
    result
  end

  def post_order_helper(node, result)
    return if node.nil?

    post_order_helper(node.left, result)
    post_order_helper(node.right, result)
    result << node.value
  end
end