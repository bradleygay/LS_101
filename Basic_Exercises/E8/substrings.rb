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
