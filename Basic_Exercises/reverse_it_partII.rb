def reverse_words(string)
  arr = []
  string.split.each do |word|
    word.length >= 5 ? arr << word.reverse : arr << word
  end
  arr.join(" ")
end
