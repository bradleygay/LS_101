#method takes one argument (integer) and returns list of digits in argument

#convert integer into string, then separate into list (array of strings -> array of numbers)

# Goal = Convert an integer into list of digits

def digit_list(integer)
  p integer.to_s.chars.map { |digit| digit.to_i }
end

puts digit_list(12345)