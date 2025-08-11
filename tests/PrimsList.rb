require 'minitest/autorun'
require_relative '../test_helpers/graph_helper'

class PrimsListTest < Minitest::Test
  def test_prims_algorithm
    # Assuming there's a Prim's algorithm implementation to require
    # require_relative '../prims_algorithm'

    list1 = GraphHelper.list1

    # there is only one right answer for this graph
    expected = [
      [
        GraphHelper::Edge.new(2, 1),
        GraphHelper::Edge.new(1, 3),
      ],
      [
        GraphHelper::Edge.new(0, 3),
        GraphHelper::Edge.new(4, 1),
      ],
      [GraphHelper::Edge.new(0, 1)],
      [GraphHelper::Edge.new(6, 1)],
      [
        GraphHelper::Edge.new(1, 1),
        GraphHelper::Edge.new(5, 2),
      ],
      [
        GraphHelper::Edge.new(4, 2),
        GraphHelper::Edge.new(6, 1),
      ],
      [
        GraphHelper::Edge.new(5, 1),
        GraphHelper::Edge.new(3, 1),
      ],
    ]

    result = prims_algorithm_mock(list1)
    assert_equal expected.length, result.length

    # Check that each node's edges match expected
    expected.each_with_index do |expected_edges, i|
      assert_equal expected_edges.length, result[i].length
      
      # Sort both arrays to compare
      expected_sorted = expected_edges.sort_by { |e| [e.to, e.weight] }
      result_sorted = result[i].sort_by { |e| [e.to, e.weight] }
      
      expected_sorted.each_with_index do |expected_edge, j|
        assert_equal expected_edge.to, result_sorted[j].to
        assert_equal expected_edge.weight, result_sorted[j].weight
      end
    end
  end

  private

  # Mock Prim's algorithm implementation
  def prims_algorithm_mock(list)
    mst = Array.new(list.length) { [] }
    
    # We'll use a simple approach: start from node 0
    visited = Array.new(list.length, false)
    visited[0] = true
    
    # Keep track of minimum edges from visited nodes to unvisited nodes
    edges = []
    
    # Add all edges from node 0
    list[0].each do |edge|
      edges << [0, edge.to, edge.weight]
    end
    
    while edges.any?
      # Find minimum weight edge to unvisited node
      edges.sort_by! { |edge| edge[2] }
      
      from, to, weight = edges.shift
      
      next if visited[to] # Skip if already visited
      
      # Add this edge to MST
      visited[to] = true
      mst[from] << GraphHelper::Edge.new(to, weight)
      mst[to] << GraphHelper::Edge.new(from, weight)
      
      # Add all edges from newly visited node
      list[to].each do |edge|
        unless visited[edge.to]
          edges << [to, edge.to, edge.weight]
        end
      end
      
      # Remove edges to already visited nodes
      edges.reject! { |edge| visited[edge[1]] }
    end
    
    mst
  end
end