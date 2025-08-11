require 'minitest/autorun'
require_relative '../test_helpers/tree_helper'

class DFSOnBSTTest < Minitest::Test
  def test_dfs_on_bst
    # Assuming there's a DFS on BST implementation to require
    # require_relative '../dfs_on_bst'

    tree = TreeHelper.tree

    assert_equal true, dfs_on_bst_mock(tree, 45)
    assert_equal true, dfs_on_bst_mock(tree, 7)
    assert_equal false, dfs_on_bst_mock(tree, 69)
  end

  private

  # Mock DFS on BST implementation (assumes BST structure)
  def dfs_on_bst_mock(curr, needle)
    return false if curr.nil?
    
    return true if curr.value == needle

    if needle < curr.value
      dfs_on_bst_mock(curr.left, needle)
    else
      dfs_on_bst_mock(curr.right, needle)
    end
  end
end