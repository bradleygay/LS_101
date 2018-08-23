def word_sizes(str)
  counter = Hash.new(0)
  arr = str.chars.select do |char|
    char == " " || ('a'..'z').include?(char.downcase)
  end
  arr.join.split.each do |word|
    counter[word.size] += 1
  end
  counter
end
