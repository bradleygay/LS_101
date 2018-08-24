def reverse!(arr)
  new_arr = arr.clone
  arr.clear
  arr << new_arr.pop until new_arr.empty?
  arr
end
