def prompt(msg)
  p "=> #{msg}"
end

prompt "Please enter a word(s): "
input = gets.chomp
squeezed_input = input.delete(" ")

p "There are #{squeezed_input.length} characters in '#{input}'."
