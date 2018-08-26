def letter_case_count(str)
  hsh = { Uppercase: 0, Lowercase: 0, Other: 0 }
  str.chars.each do |char|
    if ("A".."Z").include?(char)
      hsh[:Uppercase] += 1
    elsif ("a".."z").include?(char)
      hsh[:Lowercase] += 1
    else
      hsh[:Other] += 1
    end
  end
  hsh
end
