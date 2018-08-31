def rotate_array(arr)
  new_arr = arr[1..-1]
  new_arr << arr[0]
  new_arr
end

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

def max_rotation(num)
  arr = num.digits.reverse
  digits = arr.size
  result = []
  loop do
    new_arr = rotate_array(arr)
    result << new_arr[0]
    new_arr.shift
    arr = new_arr
    break if new_arr.size == 0
  end
  result.join.to_i
end
