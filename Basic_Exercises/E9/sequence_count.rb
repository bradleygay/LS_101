def sequence(num1, num2)
  arr = []
  starting_num = num2
  num1.times do
    arr << starting_num
    starting_num += num2
  end
  arr
end
