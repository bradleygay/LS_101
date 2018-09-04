def diamond(num)
  spaces = num / 2
  stars = 1
  loop do
    puts "#{' ' * spaces}#{'*' * stars}"
    spaces -= 1
    stars += 2
    break if stars == num
  end
  spaces = 0
  stars = num
  loop do
    puts "#{' ' * spaces}#{'*' * stars}"
    spaces += 1
    stars -= 2
    break if stars < 0
  end
end
