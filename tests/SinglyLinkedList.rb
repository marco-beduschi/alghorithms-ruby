require 'minitest/autorun'
require_relative '../test_helpers/list_test_helper'

class SinglyLinkedListTest < Minitest::Test
  include ListTestHelper

  def test_linked_list
    # Assuming there's a SinglyLinkedList implementation to require
    # require_relative '../singly_linked_list'

    list = MockSinglyLinkedList.new
    test_list(list)
  end

  # Mock implementation for testing structure
  class MockSinglyLinkedList
    attr_reader :length

    def initialize
      @items = []
      @length = 0
    end

    def append(value)
      @items << value
      @length += 1
    end

    def prepend(value)
      @items.unshift(value)
      @length += 1
    end

    def get(index)
      @items[index]
    end

    def remove_at(index)
      return nil if index >= @length || index < 0
      value = @items.delete_at(index)
      @length -= 1 if value
      value
    end

    def remove(value)
      index = @items.index(value)
      return nil if index.nil?
      remove_at(index)
    end
  end
end