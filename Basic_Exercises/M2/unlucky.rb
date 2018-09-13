require 'date'

def friday_13th(year)
  counter = 0
  calendar = Date.new(year, 1, 1)..Date.new(year, 12, 31)
  calendar.each do |day|
    counter += 1 if day.day == 13 && day.friday?
  end
  counter
end
