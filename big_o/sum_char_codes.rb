# Example of an O(n) alghorithm

def sum_char_codes(n)
  sum = 0

  (0..(n.length - 1)).each do |i|
    sum += n[i].ord
  end

  sum
end


puts sum_char_codes('This is a very long string')
