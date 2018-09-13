def triangle(int1, int2, int3)
  sides = [int1, int2, int3]
  longest_side = sides.max
  case
  when longest_side > sides.min(2).reduce(:+), sides.include?(0)
    :invalid
  when int1 == int2 && int2 == int3
    :equilateral
  when int1 == int2 || int2 == int3 || int1 == int3
    :isosceles
  else
    :scalene
  end
end
