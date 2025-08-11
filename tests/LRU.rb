require 'minitest/autorun'

class LRUTest < Minitest::Test
  def test_lru
    # Assuming there's an LRU cache implementation to require
    # require_relative '../lru'

    lru = MockLRU.new(3)

    assert_nil lru.get("foo")
    lru.update("foo", 69)
    assert_equal 69, lru.get("foo")

    lru.update("bar", 420)
    assert_equal 420, lru.get("bar")

    lru.update("baz", 1337)
    assert_equal 1337, lru.get("baz")

    lru.update("ball", 69420)
    assert_equal 69420, lru.get("ball")
    assert_nil lru.get("foo")  # Should be evicted
    assert_equal 420, lru.get("bar")
    
    lru.update("foo", 69)
    assert_equal 420, lru.get("bar")
    assert_equal 69, lru.get("foo")

    # baz should be evicted as it was the least recently used
    assert_nil lru.get("baz")
  end

  # Mock LRU implementation
  class MockLRU
    def initialize(capacity)
      @capacity = capacity
      @cache = {}
      @order = []
    end

    def get(key)
      if @cache.key?(key)
        # Move to front (most recently used)
        @order.delete(key)
        @order.unshift(key)
        @cache[key]
      else
        nil
      end
    end

    def update(key, value)
      if @cache.key?(key)
        # Update existing key
        @cache[key] = value
        @order.delete(key)
        @order.unshift(key)
      else
        # Add new key
        if @cache.size >= @capacity
          # Evict least recently used
          lru_key = @order.pop
          @cache.delete(lru_key)
        end
        @cache[key] = value
        @order.unshift(key)
      end
    end
  end
end