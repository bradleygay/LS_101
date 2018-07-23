def reverse_sentence(str)
  str.split.reverse.join(' ')
end

p reverse_sentence("Hello World")