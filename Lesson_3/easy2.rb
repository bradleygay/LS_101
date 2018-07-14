# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# p ages.has_key?("Spot")
# p ages.include?("Spot")

#-------------

# munsters_description = "The Munsters are creepy in a good way."

# p munsters_description.capitalize
# p munsters_description.swapcase!
# p munsters_description.downcase!
# p munsters_description.upcase!

#--------------

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

# additional_ages = { "Marilyn" => 22, "Spot" => 237 }

# p ages.merge!(additional_ages)

#-------------

# advice = "Few things in life are as important as house training your pet dinosaur."

# p advice.include?("Dino")
# p advice.match("important")

#-------------

# flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

# p flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

#-------------

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# p flintstones.push("Dino")
# p flintstones << "Dino"

#-------------

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# # p flintstones.concat(["Dino", "Hoppy"])
# # p flintstones.concat(%w(Dino Hoppy))
# p flintstones.push("Dino", "Hoppy")

#-------------

# advice = "Few things in life are as important as house training your pet dinosaur."

# p new_advice = advice.slice!(0, advice.index('house'))
# p advice

#-------------

# statement = "The Flintstones Rock!"

# p statement.count("t")

#-------------

