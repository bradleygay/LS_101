HOUR_DAY = 24
MIN_HOUR = 60
MIN_DAY = HOUR_DAY * MIN_HOUR

def time_of_day(int)
  int %= MIN_DAY
  hours = int / MIN_HOUR
  minutes = int % MIN_HOUR
  if int >= 0
    "#{sprintf('%02d', hours)}:#{sprintf('%02d', minutes)}"
  elsif int < 0
    "#{sprintf('%02d', 24 - hours)}:#{sprintf('%02d', 60 - minutes)}"
  end
end
