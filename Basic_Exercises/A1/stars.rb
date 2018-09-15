def star(num)
  spaces = num - 3
  counter = 0
  loop do
    puts ' ' * counter + '*' + ' ' * (spaces / 2 - counter) + '*' + ' ' * (spaces / 2 - counter) + '*' + ' ' * counter
    counter += 1
    break if counter > spaces / 2
  end
  puts '*' * num
  loop do
    counter -= 1
    break if counter < 0
    puts ' ' * counter + '*' + ' ' * (spaces / 2 - counter) + '*' + ' ' * (spaces / 2 - counter) + '*' + ' ' * counter
  end
end
