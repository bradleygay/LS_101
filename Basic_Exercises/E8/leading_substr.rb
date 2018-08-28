def substrings_at_start(str)
  str.chars.map.with_index do |_, idx|
    str[0..idx]
  end
end
    