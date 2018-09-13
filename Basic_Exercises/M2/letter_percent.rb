def letter_percentages(str)
  total = str.length.to_f
  hsh = {:lowercase => 0, :uppercase => 0, :neither => 0}
  dc_counter = 0
  uc_counter = 0
  other_counter = 0
  str.chars.map do |letter|
    if letter =~ /[a-z]/
      dc_counter += 1
      hsh[:lowercase] = 100 * (dc_counter / total)
    elsif letter =~ /[A-Z]/
      uc_counter += 1
      hsh[:uppercase] = 100 * (uc_counter / total)
    else
      other_counter += 1
      hsh[:neither] = 100 * (other_counter / total)
    end
  end
  hsh
end
