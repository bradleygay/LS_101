def twice(num)
  str = num.to_s
  center = str.size / 2
  left_digits = center.zero? ? '' : str[0..center - 1]
  right_digits = str[center..-1]
  return num if left_digits == right_digits
  return num * 2
end
