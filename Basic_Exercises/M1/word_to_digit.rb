def word_to_digit(sentence)
  arr = sentence.split(/\b/).map do |word|
    case word.downcase
    when 'zero'  then 0
    when 'one'   then 1
    when 'two'   then 2
    when 'three' then 3
    when 'four'  then 4
    when 'five'  then 5
    when 'six'   then 6
    when 'seven' then 7
    when 'eight' then 8
    when 'nine'  then 9
    else         word
    end
  end
  arr.join
end
