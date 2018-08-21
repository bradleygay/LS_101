def short_long_short(str1, str2)
  str1.length > str2.length ? str2.concat(str1, str2) : str1.concat(str2, str1)
end
