DATE = Time.new.year

p "What is your current age?"
current_age = gets.chomp.to_i

p "At what age do you wish to retire?"
retire_age = gets.chomp.to_i

time = retire_age - current_age
retire_date = DATE + time

p "It is #{DATE}. You will retire in #{retire_date}."
p "You have only #{time} years of work to go!"
