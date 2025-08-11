require 'minitest/autorun'
require_relative '../test_helpers/list_test_helper'

class ArrayListTest < Minitest::Test
  include ListTestHelper

  def test_array_list
    # Assuming there's an ArrayList implementation to require
    # require_relative '../array_list'
    
    # For now, creating a mock list object that responds to the expected methods
    list = MockArrayList.new(3)
    test_list(list)
  end

  # Mock implementation for testing structure
  class MockArrayList
    attr_reader :length

    def initialize(capacity)
      @items = []
      @capacity = capacity
      @length = 0
    end

    def append(value)
      @items[@length] = value
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
      return nil if index >= @length
      value = @items[index]
      @items.delete_at(index)
      @length -= 1
      value
    end

    def remove(value)
      index = @items.index(value)
      return nil if index.nil?
      remove_at(index)
    end
  end
end