def rotate_rightmost_digits(num, digit_count)
  arr = num.digits.reverse
  new_arr = []
  if digit_count == 1
    new_arr << arr
  else
    new_arr << arr[0..-digit_count - 1]
    new_arr << arr[-digit_count + 1..-1] + [arr[-digit_count]]
  end
  new_arr.flatten.join.to_i
end
