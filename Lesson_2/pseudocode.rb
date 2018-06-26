# Given two integers (numbers)
# Define a method that will add the two integers together
# Output sum

# START program
# SET parameters while DEFining summation method
# Addition Logic (remember to convert strings to integers)
# PRINT method call with two given integers
# END program

def sum(a, b)
  a.to_i() + b.to_i()
end

puts(sum(4, 5))


# Given an array of strings from user
# Method call on array of strings
# Returns concatenated string from array

# START program
# GET string input from user (array)
# SET variables
  # array = [s, t, r, i, n, g, s]
  # new_array = "strings"
# DEFine method
  # new_array = array.concatenate()
# PRINT new_array
# END program

array = [1, 2, 3, 4, 5]
new_array = array.join()
puts(new_array)


# Given an array of integers (numbers)
# Method call on array of integers
# New array contains every other integer from original array
# Returns new array of integers

# START program
# GET integer input from user (array)
# SET variables
  # from GET -> array = [1, 2, 3, 4, 5]
  # new_array = [1, 3, 5]
# DEFine method
  # new_array = array.select_every_other()
    # use index to select every other integer
# PRINT new_array
# END program

array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
new_array = array.select.with_index { |index| (index + 1) % 2 == 1 }
p(new_array)
