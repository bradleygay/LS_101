def word_lengths(str)
  str.split.map do |word|
    "#{word} #{word.size}"
  end
end
