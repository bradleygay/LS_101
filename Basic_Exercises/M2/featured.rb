def unique_num(num)
  num.digits.reverse == num.digits.reverse.uniq
end

def featured(num)
  loop do
    num += 1
    if num % 7 == 0 && num.odd? && unique_num(num)
      return num
    end
    break if num > 9_999_999_999
  end
  'There is no possible number that fulfills those requirements.'
end
