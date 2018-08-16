SQM_TO_SQF = 10.7639

p "Enter the length of the room, in meters?"
length = gets.chomp.to_f

p "Enter the width of the room, in meters?"
width = gets.chomp.to_f

area_meter = (length * width).round(2)
area_feet = (area_meter * SQM_TO_SQF).round(2)
p "The area of the room is #{area_meter} square meters (#{area_feet} square feet)."
