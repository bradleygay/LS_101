def fibonacci_last(num)
  arr = [1, 1]
  (num - 2).times do arr << arr[-1] + arr[-2]
  end
  result = arr.last
  result.to_s[-1].to_i
end
