require 'minitest/autorun'

class TrieTest < Minitest::Test
  def test_trie
    # Assuming there's a Trie implementation to require
    # require_relative '../trie'

    trie = MockTrie.new
    trie.insert("foo")
    trie.insert("fool")
    trie.insert("foolish")
    trie.insert("bar")

    expected = ["foo", "fool", "foolish"]
    assert_equal expected, trie.find("fo").sort

    trie.delete("fool")

    expected = ["foo", "foolish"]
    assert_equal expected, trie.find("fo").sort
  end

  # Mock Trie implementation
  class MockTrie
    class TrieNode
      attr_accessor :is_word, :children

      def initialize
        @is_word = false
        @children = {}
      end
    end

    def initialize
      @root = TrieNode.new
    end

    def insert(word)
      current = @root
      word.each_char do |char|
        current.children[char] ||= TrieNode.new
        current = current.children[char]
      end
      current.is_word = true
    end

    def find(prefix)
      current = @root
      prefix.each_char do |char|
        return [] unless current.children[char]
        current = current.children[char]
      end

      words = []
      find_words(current, prefix, words)
      words
    end

    def delete(word)
      delete_helper(@root, word, 0)
    end

    private

    def find_words(node, prefix, words)
      words << prefix if node.is_word

      node.children.each do |char, child_node|
        find_words(child_node, prefix + char, words)
      end
    end

    def delete_helper(node, word, index)
      return false if index == word.length

      char = word[index]
      child = node.children[char]
      return false unless child

      if index == word.length - 1
        # We're at the end of the word
        child.is_word = false
        return child.children.empty?
      end

      should_delete_child = delete_helper(child, word, index + 1)

      if should_delete_child
        node.children.delete(char)
        return !node.is_word && node.children.empty?
      end

      false
    end
  end
end