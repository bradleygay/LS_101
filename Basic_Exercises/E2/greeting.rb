def name
  name = gets.chomp
  if name.include? "!" 
    p "HELLO #{name.upcase.chop}. WHY ARE WE SCREAMING?"
  else
    p "Hello, #{name.capitalize}."
  end
end

p "What is your name?"
name
