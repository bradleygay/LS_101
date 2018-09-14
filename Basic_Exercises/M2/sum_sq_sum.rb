def sum_square_difference(num)
  arr = (1..num).to_a
  sum_square = (arr.reduce(:+))**2
  square_sum = arr.map { |num| num**2 }.reduce(:+)
  difference = sum_square - square_sum
end
