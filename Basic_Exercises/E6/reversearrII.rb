def reverse(arr)
  new_arr = []
  new_arr << arr.sort { |a, b| b <=> a }
  new_arr.flatten
end
