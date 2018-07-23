def reverse_sentence(str)
  array = []
  str.split.each do |word|
    if word.length >= 5
      array << word.reverse
    else
      array << word
    end
  end
  array.join(' ')
end


reverse_sentence("I am the walrus")
reverse_sentence("I know you are but what am I")
reverse_sentence("Antidisestablishmentarianism")