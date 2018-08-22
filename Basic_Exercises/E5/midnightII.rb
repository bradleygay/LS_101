HOUR_DAY = 24
MIN_HOUR = 60
MIN_DAY = HOUR_DAY * MIN_HOUR

def after_midnight(str)
  arr = str.split(':').map { |num| num.to_i }
  ((arr[0] % HOUR_DAY) * MIN_HOUR) + arr[1]
end

def before_midnight(str)
  arr = str.split(':').map { |num| num.to_i }
  MIN_DAY - (((arr[0] % HOUR_DAY) * MIN_HOUR) + arr[1])
end
