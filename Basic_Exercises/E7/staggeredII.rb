def staggered_case(str)
  new_str = str.chars
  index_counter = 0
  new_str.map do |char|
    if char =~ /[a-zA-z]/
      index_counter.even? ? new_str << char.upcase : new_str << char.downcase
      index_counter += 1
    else
      new_str << char
    end
  end
  new_str.join
end
