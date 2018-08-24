VOWELS = %w(a e i o u)

def remove_vowels(arr)
  arr.map do |str|
    str_wo_vowels = ""
    str.chars.each do |char|
      str_wo_vowels << char unless VOWELS.include?(char.downcase)
    end
    str_wo_vowels
  end
end
