require 'minitest/autorun'

class RingBufferTest < Minitest::Test
  def test_ring_buffer
    # Assuming there's a RingBuffer implementation to require
    # require_relative '../ring_buffer'

    buffer = MockRingBuffer.new

    buffer.push(5)
    assert_equal 5, buffer.pop
    assert_nil buffer.pop

    buffer.push(42)
    buffer.push(9)
    assert_equal 42, buffer.pop
    assert_equal 9, buffer.pop
    assert_nil buffer.pop

    buffer.push(42)
    buffer.push(9)
    buffer.push(12)
    assert_equal 12, buffer.get(2)
    assert_equal 9, buffer.get(1)
    assert_equal 42, buffer.get(0)
  end

  # Mock RingBuffer implementation
  class MockRingBuffer
    def initialize(capacity = 3)
      @capacity = capacity
      @buffer = Array.new(capacity)
      @head = 0
      @tail = 0
      @size = 0
    end

    def push(value)
      @buffer[@tail] = value
      @tail = (@tail + 1) % @capacity

      if @size < @capacity
        @size += 1
      else
        @head = (@head + 1) % @capacity
      end
    end

    def pop
      return nil if @size == 0

      value = @buffer[@head]
      @head = (@head + 1) % @capacity
      @size -= 1
      value
    end

    def get(idx)
      return nil if idx >= @size
      actual_idx = (@head + idx) % @capacity
      @buffer[actual_idx]
    end
  end
end