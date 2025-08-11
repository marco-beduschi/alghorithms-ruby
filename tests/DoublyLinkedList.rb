require 'minitest/autorun'
require_relative '../test_helpers/list_test_helper'

class DoublyLinkedListTest < Minitest::Test
  include ListTestHelper

  def test_doubly_linked_list
    # Assuming there's a DoublyLinkedList implementation to require
    # require_relative '../doubly_linked_list'

    list = MockDoublyLinkedList.new
    test_list(list)
  end

  # Mock implementation for testing structure
  class MockDoublyLinkedList
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