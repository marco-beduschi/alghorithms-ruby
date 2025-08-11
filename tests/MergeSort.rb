require 'minitest/autorun'

class MergeSortTest < Minitest::Test
  def test_merge_sort
    # Assuming there's a merge sort implementation to require
    # require_relative '../merge_sort'

    arr = [9, 3, 7, 4, 69, 420, 42]
    merge_sort_mock!(arr)
    assert_equal [3, 4, 7, 9, 42, 69, 420], arr
  end

  private

  # Mock merge sort implementation (in-place sorting)
  def merge_sort_mock!(arr)
    return if arr.length <= 1
    
    mid = arr.length / 2
    left = arr[0...mid]
    right = arr[mid..-1]
    
    merge_sort_mock!(left)
    merge_sort_mock!(right)
    
    merge!(arr, left, right)
  end

  def merge!(arr, left, right)
    i = j = k = 0
    
    while i < left.length && j < right.length
      if left[i] <= right[j]
        arr[k] = left[i]
        i += 1
      else
        arr[k] = right[j]
        j += 1
      end
      k += 1
    end
    
    while i < left.length
      arr[k] = left[i]
      i += 1
      k += 1
    end
    
    while j < right.length
      arr[k] = right[j]
      j += 1
      k += 1
    end
  end
end