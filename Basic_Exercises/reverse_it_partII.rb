def reverse_words(string)
  arr = []
  string.split.each do |word|
    word.length >= 5 ? arr << word.reverse : arr << word
  end
  arr.join(" ")
end

p reverse_words("Antidisestablishmentarianism")
p reverse_words("I know you are but what am I")
p reverse_words("I am the walrus")