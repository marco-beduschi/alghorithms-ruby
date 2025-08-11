require 'minitest/autorun'

class MinHeapTest < Minitest::Test
  def test_min_heap
    # Assuming there's a MinHeap implementation to require
    # require_relative '../min_heap'

    heap = MockMinHeap.new

    assert_equal 0, heap.length

    heap.insert(5)
    heap.insert(3)
    heap.insert(69)
    heap.insert(420)
    heap.insert(4)
    heap.insert(1)
    heap.insert(8)
    heap.insert(7)

    assert_equal 8, heap.length
    assert_equal 1, heap.delete
    assert_equal 3, heap.delete
    assert_equal 4, heap.delete
    assert_equal 5, heap.delete
    assert_equal 4, heap.length
    assert_equal 7, heap.delete
    assert_equal 8, heap.delete
    assert_equal 69, heap.delete
    assert_equal 420, heap.delete
    assert_equal 0, heap.length
  end

  # Mock MinHeap implementation
  class MockMinHeap
    attr_reader :length

    def initialize
      @data = []
      @length = 0
    end

    def insert(value)
      @data[@length] = value
      heapify_up(@length)
      @length += 1
    end

    def delete
      return nil if @length == 0

      out = @data[0]
      @length -= 1

      if @length == 0
        @data = []
        return out
      end

      @data[0] = @data[@length]
      heapify_down(0)
      out
    end

    private

    def parent(idx)
      (idx - 1) / 2
    end

    def left_child(idx)
      idx * 2 + 1
    end

    def right_child(idx)
      idx * 2 + 2
    end

    def heapify_down(idx)
      return if idx >= @length

      l_idx = left_child(idx)
      r_idx = right_child(idx)

      return if l_idx >= @length

      l_val = @data[l_idx]
      r_val = @data[r_idx]
      val = @data[idx]

      if r_idx >= @length
        # Only left child
        if l_val < val
          @data[idx] = l_val
          @data[l_idx] = val
          heapify_down(l_idx)
        end
      elsif l_val < r_val && l_val < val
        @data[idx] = l_val
        @data[l_idx] = val
        heapify_down(l_idx)
      elsif r_val < val
        @data[idx] = r_val
        @data[r_idx] = val
        heapify_down(r_idx)
      end
    end

    def heapify_up(idx)
      return if idx == 0

      p_idx = parent(idx)
      parent_val = @data[p_idx]
      val = @data[idx]

      if parent_val > val
        @data[idx] = parent_val
        @data[p_idx] = val
        heapify_up(p_idx)
      end
    end
  end
end