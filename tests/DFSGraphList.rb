require 'minitest/autorun'
require_relative '../test_helpers/graph_helper'

class DFSGraphListTest < Minitest::Test
  def test_dfs_graph
    # Assuming there's a DFS graph implementation to require
    # require_relative '../dfs_graph_list'

    list2 = GraphHelper.list2

    expected = [0, 1, 4, 5, 6]
    assert_equal expected, dfs_graph_mock(list2, 0, 6)

    assert_nil dfs_graph_mock(list2, 6, 0)
  end

  private

  # Mock DFS graph implementation
  def dfs_graph_mock(graph, source, needle)
    seen = Array.new(graph.length, false)
    prev = Array.new(graph.length, -1)
    
    path = []
    found = walk(graph, source, needle, seen, prev, path)
    
    return nil unless found

    # Build path backwards from needle to source using prev array
    curr = needle
    result = []
    
    while curr != -1
      result.unshift(curr)
      curr = prev[curr]
    end

    result
  end

  def walk(graph, curr, needle, seen, prev, path)
    if seen[curr]
      return false
    end

    seen[curr] = true
    path << curr

    if curr == needle
      return true
    end

    # Pre-order traversal
    graph[curr].each do |edge|
      next if seen[edge.to]
      
      prev[edge.to] = curr
      
      if walk(graph, edge.to, needle, seen, prev, path)
        return true
      end
    end

    path.pop
    false
  end
end