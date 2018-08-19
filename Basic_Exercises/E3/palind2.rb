ALPHANUM = [('a'..'z').to_a, ('0'..'9').to_a]

def palindrome?(str)
  new_str = str.downcase.chars.each do |char|
    ALPHANUM.include?(str)
  end
  new_str == new_str.reverse
end
