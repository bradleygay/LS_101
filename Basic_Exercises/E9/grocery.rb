def buy_fruit(arr)
  new_arr = []
  arr.map do |sub_arr|
    fruit, number = sub_arr[0], sub_arr[1]
    number.times do new_arr << fruit
    end
  end
  new_arr
end
