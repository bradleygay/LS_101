def rotate_array(arr)
  new_arr = arr[1..-1]
  new_arr << arr[0]
  new_arr
end
