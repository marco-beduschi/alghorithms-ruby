require 'minitest/autorun'

class BubbleSortTest < Minitest::Test
  def test_bubble_sort
    # Assuming there's a bubble sort implementation to require
    # require_relative '../bubble_sort'

    arr = [9, 3, 7, 4, 69, 420, 42]

    # For now using a mock bubble sort function
    bubble_sort_mock!(arr)
    assert_equal [3, 4, 7, 9, 42, 69, 420], arr
  end

  private

  # Mock bubble sort implementation (in-place sorting)
  def bubble_sort_mock!(arr)
    n = arr.length
    
    (n - 1).times do |i|
      (n - i - 1).times do |j|
        if arr[j] > arr[j + 1]
          arr[j], arr[j + 1] = arr[j + 1], arr[j]
        end
      end
    end
  end
end