def triangle(int1, int2, int3)
  angles = [int1, int2, int3]
  case
  when angles.reduce(:+) != 180, angles.include?(0)
    :invalid
  when angles.include?(90)
    :right
  when angles.any? { |angle| angle > 90 }
    :obtuse
  when angles.all? { |angle| angle < 90 }
    :acute
  end
end
