require 'minitest/autorun'

class InsertionSortTest < Minitest::Test
  def test_insertion_sort
    # Assuming there's an insertion sort implementation to require
    # require_relative '../insertion_sort'

    arr = [9, 3, 7, 4, 69, 420, 42]
    insertion_sort_mock!(arr)
    assert_equal [3, 4, 7, 9, 42, 69, 420], arr
  end

  private

  # Mock insertion sort implementation (in-place sorting)
  def insertion_sort_mock!(arr)
    (1...arr.length).each do |i|
      key = arr[i]
      j = i - 1

      # Move elements that are greater than key one position ahead
      while j >= 0 && arr[j] > key
        arr[j + 1] = arr[j]
        j -= 1
      end

      arr[j + 1] = key
    end
  end
end