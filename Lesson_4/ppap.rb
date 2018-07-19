# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# flintstones_hash = {}

# flintstones.each_with_index do |name, idx|
#   flintstones_hash[name] = idx
# end

# p flintstones_hash

#-------------

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# ages_sum = ages.values.sum

# p ages_sum

#-------------

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# ages.delete_if { |key, value| value >= 100 }

# p ages

#-------------

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# ages_min = ages.values.min

# p ages_min

#-------------

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# p flintstones.index { |name| name[0,2] == "Be" }

#-------------

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# flintstones_small = flintstones.map { |name| name[0,3] }

# p flintstones_small

#-------------

# statement = "The Flintstones Rock"
# new_hash = {}
# letters = ('a'..'z').to_a

# letters.each do |letter|
#   frequency = statement.downcase.scan(letter).count
#   if frequency > 0
#     new_hash[letter] = frequency
#   end
# end

# p new_hash

#-------------

# words = "the flintstones rock!"

# words = words.split.map { |word| word.capitalize }.join(' ')

# p words

#-------------

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
age_group = {}

munsters.each do |name, values|
  case values["age"]
  when 0..18
    values["age group"] = "kid"
  when 19..64
    values["age group"] = "adult"
  else
    values["age group"] = "senior"
  end
end

p munsters

