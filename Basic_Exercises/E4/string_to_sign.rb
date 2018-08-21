INTEGERS = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
             '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
           }  

def string_to_integer(str)
  integer = str.chars.map { |char| INTEGERS[char] }
  value = 0
  integer.each do |num|
    value = 10 * value + num
  end
  value
end

def string_to_sign(str)
  case str[0]
  when '+' then string_to_integer(str[(1..-1)])
  when '-' then -string_to_integer(str[(1..-1)])
  else string_to_integer(str)
  end
end
