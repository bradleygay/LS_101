def center_of(str)
  center = str.size / 2
  str.size.odd? ? str[center] : str[center - 1..center]
end
