def halvsies(arr)
  new_arr = []
  half_array = arr.size / 2
  if arr.count.odd?
    new_arr << arr.slice(0..half_array)
    new_arr << arr.slice(half_array + 1..arr.size)
  elsif arr.count.even?
    new_arr << arr.slice(0..half_array - 1)
    new_arr << arr.slice(half_array..arr.size)
  end
  new_arr
end
