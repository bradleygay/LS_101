def prompt(msg)
  p "=> #{msg}"
end

prompt "Please enter a noun: "
noun = gets.chomp
prompt "Please enter a verb: "
verb = gets.chomp
prompt "Please enter an adjective: "
adjective = gets.chomp
prompt "Please enter an adverb: "
adverb = gets.chomp

p "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
