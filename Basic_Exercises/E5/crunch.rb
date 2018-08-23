def crunch(str)
  new_str = ''
  str.each_char do |char|
      new_str << char if char != new_str[-1]
  end
  new_str
end
