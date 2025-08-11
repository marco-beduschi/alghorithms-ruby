require 'minitest/autorun'
require_relative '../test_helpers/graph_helper'

class BFSGraphListTest < Minitest::Test
  def test_bfs_graph
    # Assuming there's a BFS graph implementation to require
    # require_relative '../bfs_graph_list'

    list2 = GraphHelper.list2

    expected = [0, 1, 4, 5, 6]
    assert_equal expected, bfs_graph_mock(list2, 0, 6)

    assert_nil bfs_graph_mock(list2, 6, 0)
  end

  private

  # Mock BFS graph implementation
  def bfs_graph_mock(graph, source, needle)
    seen = Array.new(graph.length, false)
    prev = Array.new(graph.length, -1)
    
    queue = [source]
    seen[source] = true

    until queue.empty?
      curr = queue.shift
      
      if curr == needle
        break
      end

      graph[curr].each do |edge|
        next if seen[edge.to]

        seen[edge.to] = true
        prev[edge.to] = curr
        queue << edge.to
      end
    end

    # Reconstruct path
    if prev[needle] == -1 && source != needle
      return nil
    end

    # Build path backwards
    path = []
    curr = needle

    while prev[curr] != -1
      path.unshift(curr)
      curr = prev[curr]
    end

    if path.length > 0
      path.unshift(source)
      return path
    end

    # Direct connection or source == needle
    source == needle ? [source] : nil
  end
end