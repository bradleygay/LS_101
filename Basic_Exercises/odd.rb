#method takes one integer argument (+/1/0)
#method returns true if |argument| = odd

def absval(integer)
  if integer > 0 || integer == 0
    integer
  else
    integer.to_i * -1
  end
end

def is_odd?(integer)
  integer = absval(integer)
  if integer % 2 == 1
    p 'true'
  else
    p 'false'
  end
end

p 'Please enter an integer (the value may be positive, negative, or zero): '
integer = gets.chomp.to_i

is_odd?(integer)