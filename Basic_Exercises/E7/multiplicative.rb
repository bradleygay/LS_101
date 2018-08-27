def show_multiplicative_average(arr)
  result = arr.reduce(:*).to_f / arr.count
  puts "The result is #{sprintf '%.3f', result}"
end
