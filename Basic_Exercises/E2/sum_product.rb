def sum(integer)
  (1..integer).reduce(:+)
end

def product(integer)
  (1..integer).reduce(:*)
end

p "Please enter an integer greater than zero: "
integer = gets.chomp.to_i

p "Enter 's' to compute the sum; enter 'p' to compute the product: "
choice = gets.chomp.downcase

if choice == 's'
  sum = sum(integer)
  p "The sum of the integers between 1 and #{integer} is #{sum}."
elsif choice == 'p'
  product = product(integer)
  p "The product of the integers between 1 and #{integer} is #{product}."
else
  p "Unknown operation. Please enter 's' or 'p' to calculate."
end
