p "What is the total amount on the bill?"
bill = gets.chomp.to_f

p "What is the desired tip rate?"
tip_rate = gets.chomp.to_f

tip = bill * (tip_rate/100).round(2)
total = (bill + tip).round(2)

p "The tip is $#{tip}."
p "The total bill is $#{total}."
