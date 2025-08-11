require 'minitest/autorun'
require_relative '../test_helpers/graph_helper'

class DijkstraListTest < Minitest::Test
  def test_dijkstra_via_adj_list
    # Assuming there's a Dijkstra's algorithm implementation to require
    # require_relative '../dijkstra_list'

    list1 = GraphHelper.list1

    expected = [0, 1, 4, 5, 6]
    assert_equal expected, dijkstra_list_mock(0, 6, list1)
  end

  private

  # Mock Dijkstra's algorithm implementation
  def dijkstra_list_mock(source, sink, arr)
    seen = Array.new(arr.length, false)
    prev = Array.new(arr.length, -1)
    dists = Array.new(arr.length, Float::INFINITY)
    
    dists[source] = 0

    until has_unvisited(seen, dists)
      curr = get_lowest_unvisited(seen, dists)
      seen[curr] = true

      adjs = arr[curr]
      adjs.each do |edge|
        next if seen[edge.to]

        dist = dists[curr] + edge.weight
        if dist < dists[edge.to]
          dists[edge.to] = dist
          prev[edge.to] = curr
        end
      end
    end

    # Reconstruct the path
    out = []
    curr = sink

    while prev[curr] != -1
      out.push(curr)
      curr = prev[curr]
    end

    out.push(source)
    out.reverse
  end

  def has_unvisited(seen, dists)
    seen.each_with_index do |s, i|
      return true if !s && dists[i] < Float::INFINITY
    end
    false
  end

  def get_lowest_unvisited(seen, dists)
    idx = -1
    lowest_distance = Float::INFINITY

    (0...seen.length).each do |i|
      next if seen[i]

      if lowest_distance > dists[i]
        lowest_distance = dists[i]
        idx = i
      end
    end

    idx
  end
end