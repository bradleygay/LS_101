ALPHABET = ('a'..'z').to_a.freeze
VOWELS = %w(a e i o u)

def double_consonants(str)
  str.chars.map do |letter|
    ALPHABET.include?(letter.downcase) && !VOWELS.include?(letter.downcase) ? letter * 2 : letter
  end.join
end
