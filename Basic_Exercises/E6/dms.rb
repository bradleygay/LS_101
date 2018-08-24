DEGREE = "\xC2\xB0"

def dms(num)
  degrees, seconds_remaining = (num * 3600).abs.round.divmod(3600)
  minutes, seconds = seconds_remaining.divmod(60)
  sprintf(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end
