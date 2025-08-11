require 'minitest/autorun'
require_relative '../test_helpers/tree_helper'

class BTBFSTest < Minitest::Test
  def test_bt_bfs
    # Assuming there's a binary tree BFS implementation to require
    # require_relative '../bt_bfs'

    tree = TreeHelper.tree
    
    # For now using a mock BFS function
    assert_equal true, bfs_mock(tree, 45)
    assert_equal true, bfs_mock(tree, 7)
    assert_equal false, bfs_mock(tree, 69)
  end

  private

  # Mock BFS implementation
  def bfs_mock(root, target)
    return false if root.nil?

    queue = [root]

    until queue.empty?
      current = queue.shift
      return true if current.value == target

      queue << current.left if current.left
      queue << current.right if current.right
    end

    false
  end
end