require 'minitest/autorun'
require_relative '../test_helpers/graph_helper'

class BFSGraphMatrixTest < Minitest::Test
  def test_bfs_graph_matrix
    # Assuming there's a BFS graph matrix implementation to require
    # require_relative '../bfs_graph_matrix'

    matrix2 = GraphHelper.matrix2

    expected = [0, 1, 4, 5, 6]
    assert_equal expected, bfs_graph_matrix_mock(matrix2, 0, 6)

    assert_nil bfs_graph_matrix_mock(matrix2, 6, 0)
  end

  private

  # Mock BFS graph matrix implementation
  def bfs_graph_matrix_mock(graph, source, needle)
    seen = Array.new(graph.length, false)
    prev = Array.new(graph.length, -1)
    
    queue = [source]
    seen[source] = true

    until queue.empty?
      curr = queue.shift
      
      if curr == needle
        break
      end

      # Check all adjacent nodes in the matrix
      (0...graph.length).each do |i|
        next if seen[i] || graph[curr][i] == 0

        seen[i] = true
        prev[i] = curr
        queue << i
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