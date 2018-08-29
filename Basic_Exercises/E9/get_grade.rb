def get_grade(num1, num2, num3)
  mean_grade = (num1 + num2 + num3) / 3
  case mean_grade
  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  else              'F'
  end
end
