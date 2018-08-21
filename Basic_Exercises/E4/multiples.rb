def multisum(integer)
  range = (1..integer).to_a
  range.select! do |num|
    num % 3 == 0 || num % 5 == 0
  end
  range.sum
end
