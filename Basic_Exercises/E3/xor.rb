def xor?(int_one, int_two)
  return true if int_one && !int_two
  return true if int_two && !int_one
  return false
end
