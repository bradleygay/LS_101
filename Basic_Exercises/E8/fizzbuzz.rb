def fizzbuzz(num1, num2)
  arr = []
  (num1..num2).each do |num|
    if num % 3 == 0 && num % 5 == 0
      arr << 'FizzBuzz'
    elsif num % 3 == 0
      arr << 'Fizz'
    elsif num % 5 == 0
      arr << 'Buzz'
    else
      arr << num
    end
  end
  arr.join(", ")
end
