def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |sub_arr| sub_arr.reduce(:*) }
end
