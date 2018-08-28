def substrings(str)
  counter = 0
  arr = []
  loop do
    str.chars.map.with_index do |_, idx|
      arr << str[counter..idx]
    end
    break if counter > (str.size - 1)
    counter += 1
  end
  arr.delete_if { |sub_str| sub_str.empty? }
end

def palindromes(str)
  substrings(str).select do |sub_string|
    sub_string == sub_string.reverse && sub_string.size > 1
  end
end
