def interleave(arr1, arr2)
  new_arr = []
  new_arr << arr1
  new_arr << arr2
  new_arr.transpose.flatten
end
