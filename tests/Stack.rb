require 'minitest/autorun'

class StackTest < Minitest::Test
  def test_stack
    # Assuming there's a Stack implementation to require
    # require_relative '../stack'

    list = MockStack.new

    list.push(5)
    list.push(7)
    list.push(9)

    assert_equal 9, list.pop
    assert_equal 2, list.length

    list.push(11)
    assert_equal 11, list.pop
    assert_equal 7, list.pop
    assert_equal 5, list.peek
    assert_equal 5, list.pop
    assert_nil list.pop

    # just wanted to make sure that I could not blow up myself when i remove
    # everything
    list.push(69)
    assert_equal 69, list.peek
    assert_equal 1, list.length
  end

  # Mock Stack implementation
  class MockStack
    attr_reader :length

    def initialize
      @items = []
      @length = 0
    end

    def push(value)
      @items.push(value)
      @length += 1
    end

    def pop
      return nil if @length == 0
      value = @items.pop
      @length -= 1
      value
    end

    def peek
      return nil if @length == 0
      @items.last
    end
  end
end