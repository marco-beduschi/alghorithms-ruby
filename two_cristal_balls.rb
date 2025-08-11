def two_cristal_balls(haystack)
  jumpsize = Math.sqrt(haystack.length).floor

  i = jumpsize
  while i < haystack.length
    break if haystack[i]

    i += jumpsize
  end

  i -= jumpsize

  j = 0

  while j < jumpsize && i < haystack.length
    if haystack[i]
      return i
    end
    j += 1
    i += 1
  end

  return -1
end
