def binary_search(haystack, needle)
  lo = 0
  hi = haystack.size

  while lo < hi
    mid = (lo + (hi - lo) / 2).floor
    val = haystack[mid]

    if val == needle
      return true
    elsif val > needle
      hi = mid
    else
      lo = mid + 1
    end
  end

  return false
end
