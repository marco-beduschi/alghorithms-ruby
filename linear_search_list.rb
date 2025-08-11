def linear_search(haystack, needle)
  haystack.each do |item|
    return true if item == needle
  end

  false
end
