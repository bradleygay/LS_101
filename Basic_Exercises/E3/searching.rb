arr = []

p "Enter the 1st number: "
arr << gets.chomp.to_i
p "Enter the 2nd number: "
arr << gets.chomp.to_i
p "Enter the 3rd number: "
arr << gets.chomp.to_i
p "Enter the 4th number: "
arr << gets.chomp.to_i
p "Enter the 5th number: "
arr << gets.chomp.to_i

p "Enter the 6th number: "
last_number = gets.chomp.to_i

if arr.include?(last_number)
  p "The number #{last_number} appears in #{arr}." 
else
  p "The number #{last_number} does not appear in #{arr}."
end
