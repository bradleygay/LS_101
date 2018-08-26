def staggered_case(str)
  new_str = str.chars.map.with_index do |char, idx|
    idx % 2 == 0 ? char.upcase : char.downcase
  end
  new_str.join
end
