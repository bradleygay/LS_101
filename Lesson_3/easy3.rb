# 10.times { |iteration| p (" " * iteration) + "The Flintstones Rock!" }

#-------------

# calculation = 40 + 2
# puts "the value of 40 + 2 is " + calculation.to_s

# puts "the value of 40 + 2 is " + (40 + 2).to_s

# puts "the value of 40 + 2 is " + "#{40 + 2}"

#-------------

# def factors(number)
#   dividend = number
#   divisors = []
#   while dividend > 0 do
#     divisors << number / dividend if number % dividend == 0
#     dividend -= 1
#   end
#   divisors
# end

# p factors(20)

#-------------

# LIMIT = 15

# def fib(first_num, second_num)
#   while second_num < LIMIT
#     sum = first_num + second_num
#     first_num = second_num
#     second_num = sum
#   end
#   sum
# end

# result = fib(0, 1)
# puts "result is #{result}"

#-------------

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
