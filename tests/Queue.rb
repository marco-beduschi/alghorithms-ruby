require 'minitest/autorun'

class QueueTest < Minitest::Test
  def test_queue
    # Assuming there's a Queue implementation to require
    # require_relative '../queue'

    list = MockQueue.new

    list.enqueue(5)
    list.enqueue(7)
    list.enqueue(9)

    assert_equal 5, list.deque
    assert_equal 2, list.length

    list.enqueue(11)
    assert_equal 7, list.deque
    assert_equal 9, list.deque
    assert_equal 11, list.peek
    assert_equal 11, list.deque
    assert_nil list.deque
    assert_equal 0, list.length

    # just wanted to make sure that I could not blow up myself when i remove
    # everything
    list.enqueue(69)
    assert_equal 69, list.peek
    assert_equal 1, list.length
  end

  # Mock Queue implementation
  class MockQueue
    attr_reader :length

    def initialize
      @items = []
      @length = 0
    end

    def enqueue(value)
      @items.push(value)
      @length += 1
    end

    def deque
      return nil if @length == 0
      value = @items.shift
      @length -= 1
      value
    end

    def peek
      return nil if @length == 0
      @items.first
    end
  end
end