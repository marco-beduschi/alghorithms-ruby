require 'minitest/autorun'

class QuickSortTest < Minitest::Test
  def test_quick_sort
    # Assuming there's a quick sort implementation to require
    # require_relative '../quick_sort'

    arr = [9, 3, 7, 4, 69, 420, 42]
    quick_sort_mock!(arr)
    assert_equal [3, 4, 7, 9, 42, 69, 420], arr
  end

  private

  # Mock quick sort implementation (in-place sorting)
  def quick_sort_mock!(arr, low = 0, high = arr.length - 1)
    if low < high
      pivot_index = partition!(arr, low, high)
      quick_sort_mock!(arr, low, pivot_index - 1)
      quick_sort_mock!(arr, pivot_index + 1, high)
    end
  end

  def partition!(arr, low, high)
    pivot = arr[high]
    i = low - 1

    (low...high).each do |j|
      if arr[j] < pivot
        i += 1
        arr[i], arr[j] = arr[j], arr[i]
      end
    end

    arr[i + 1], arr[high] = arr[high], arr[i + 1]
    i + 1
  end
end