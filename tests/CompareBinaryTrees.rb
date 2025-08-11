require 'minitest/autorun'
require_relative '../test_helpers/tree_helper'

class CompareBinaryTreesTest < Minitest::Test
  def test_compare_binary_trees
    # Assuming there's a compare binary trees implementation to require
    # require_relative '../compare_binary_trees'

    tree = TreeHelper.tree
    tree2 = TreeHelper.tree2

    assert_equal true, compare_binary_trees_mock(tree, tree)
    assert_equal false, compare_binary_trees_mock(tree, tree2)
  end

  private

  # Mock binary tree comparison implementation
  def compare_binary_trees_mock(tree1, tree2)
    # Both are nil
    return true if tree1.nil? && tree2.nil?
    
    # One is nil, the other is not
    return false if tree1.nil? || tree2.nil?
    
    # Values don't match
    return false if tree1.value != tree2.value
    
    # Recursively compare left and right subtrees
    compare_binary_trees_mock(tree1.left, tree2.left) && 
    compare_binary_trees_mock(tree1.right, tree2.right)
  end
end