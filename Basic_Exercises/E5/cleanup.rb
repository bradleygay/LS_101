ALPHABET = ('a'..'z').to_a.freeze

def cleanup(str)
  clean_string = str.downcase.split.map do |word|
    clean_word = word.chars.map do |char|
      !ALPHABET.include?(char) ? ' ' : char
    end
    clean_word.join
  end
  clean_string.join(' ').squeeze
end
