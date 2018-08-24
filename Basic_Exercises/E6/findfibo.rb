def find_fibonacci_index_by_length(digits)
  arr = [1, 1]
  while arr[-1].to_s.size < digits
    arr << arr[-1] + arr[-2]
  end
  arr.size
end
