def print_in_box(str)
  length = str.length + 2
  p "+#{''.center(length, '-')}+"
  p "|#{''.center(length, ' ')}|"
  p "|#{str.center(length, ' ')}|"
  p "|#{''.center(length, ' ')}|"
  p "+#{''.center(length, '-')}+"
end
