def word_cap(str)
  new_str = str.split.each do |word|
    word.capitalize
  end
  new_str.join(" ")
end
