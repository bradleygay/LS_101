def gregorian?(year)
  (year % 4 == 0 && year % 100 != 0 && year % 400 != 0) ||
  (year % 4 == 0 && year % 100 == 0 && year % 400 == 0) ? true : false
end

def julius?(year)
  year % 4 == 0 ? true : false
end

def leap_year?(year)
  year >= 1752 ? gregorian?(year) : julius?(year)
end
