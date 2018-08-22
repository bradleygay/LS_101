def ascii_value(str)
  ascii = str.chars.map { |char| char.ord }
  ascii.sum
end
