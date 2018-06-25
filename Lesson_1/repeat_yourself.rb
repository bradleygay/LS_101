# method takes two arguments: string + integer
# prints string as many times as integer input

=begin
def repeat(string, integer)
  integer.times { p string }
end

repeat("Hi", 3)
=end

def repeat(string, number)
  puts "#{string}\n" * number
end

repeat("Hi", 3)