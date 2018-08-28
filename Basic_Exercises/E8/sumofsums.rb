def sum_of_sums(arr)
  sum_before = 0
  accumulated_sum = 0
  arr.each do |num|
    sum_before += num
    accumulated_sum += sum_before
  end
  accumulated_sum
end
