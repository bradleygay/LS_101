# if false
#   greeting = “hello world”
# end

# greeting

#-------------

# greetings = { a: 'hi' }
# informal_greeting = greetings[:a].clone
# informal_greeting << ' there'

# puts informal_greeting  #  => "hi there"
# puts greetings

#-------------

# def mess_with_vars(one, two, three)
#   one = two
#   two = three
#   three = one
# end

# one = "one"
# two = "two"
# three = "three"

# mess_with_vars(one, two, three)

# puts "one is: #{one}"
# puts "two is: #{two}"
# puts "three is: #{three}"

#-------------

# def mess_with_vars(one, two, three)
#   one = "two"
#   two = "three"
#   three = "one"
# end

# one = "one"
# two = "two"
# three = "three"

# mess_with_vars(one, two, three)

# puts "one is: #{one}"
# puts "two is: #{two}"
# puts "three is: #{three}"

#-------------

# def mess_with_vars(one, two, three)
#   one.gsub!("one","two") # one = "two"
#   two.gsub!("two","three") # two = "three"
#   three.gsub!("three","one") # three = "one"
# end

# one = "one"
# two = "two"
# three = "three"

# mess_with_vars(one, two, three)

# puts "one is: #{one}"
# puts "two is: #{two}"
# puts "three is: #{three}"

#-------------

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words == 4
  while dot_separated words > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end
  true
end


