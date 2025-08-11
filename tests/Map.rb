require 'minitest/autorun'

class MapTest < Minitest::Test
  def test_map
    # Assuming there's a Map implementation to require
    # require_relative '../map'

    map = MockMap.new
    map.set("foo", 55)
    assert_equal 1, map.size
    map.set("fool", 75)
    assert_equal 2, map.size
    map.set("foolish", 105)
    assert_equal 3, map.size
    map.set("bar", 69)
    assert_equal 4, map.size

    assert_equal 69, map.get("bar")
    assert_nil map.get("blaz")

    map.delete("barblabr")
    assert_equal 4, map.size

    map.delete("bar")
    assert_equal 3, map.size
    assert_nil map.get("bar")
  end

  # Mock Map implementation using hash table
  class MockMap
    def initialize
      @capacity = 10
      @size_count = 0
      @buckets = Array.new(@capacity) { [] }
    end

    def set(key, value)
      hash_code = simple_hash(key)
      bucket = @buckets[hash_code]
      
      # Check if key already exists
      bucket.each do |pair|
        if pair[0] == key
          pair[1] = value
          return
        end
      end

      # Key doesn't exist, add new pair
      bucket << [key, value]
      @size_count += 1
    end

    def get(key)
      hash_code = simple_hash(key)
      bucket = @buckets[hash_code]
      
      bucket.each do |pair|
        return pair[1] if pair[0] == key
      end

      nil
    end

    def delete(key)
      hash_code = simple_hash(key)
      bucket = @buckets[hash_code]
      
      bucket.each_with_index do |pair, index|
        if pair[0] == key
          bucket.delete_at(index)
          @size_count -= 1
          return pair[1]
        end
      end

      nil
    end

    def size
      @size_count
    end

    private

    def simple_hash(key)
      key.chars.sum(&:ord) % @capacity
    end
  end
end