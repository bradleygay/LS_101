def fibonacci(num)
  arr = [1, 1]
  (num - 2).times do arr << arr[-1] + arr[-2]
  end
  arr.last
end
