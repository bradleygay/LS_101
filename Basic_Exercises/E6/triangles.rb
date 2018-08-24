def triangle(num)
  counter = 1
  while counter <= num
    num_of_spaces = num - counter
    p (" " * num_of_spaces) + ("*" * counter)
    counter += 1
  end
end
