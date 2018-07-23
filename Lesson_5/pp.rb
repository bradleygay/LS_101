# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# age_count = 0

# munsters.each_value do |details|
#   if details["gender"] == "male"
#     age_count += details["age"] 
#   end
# end

# age_count

#-------------

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# munsters.each do |key, value|
#   p "#{key} is a #{value['age']}-year-old #{value['gender']}."
# end

#-------------

# hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

# vowels = 'aeiou'

# hsh.each do |key, value|
#   value.each do |string|
#     string.chars.each do |character|
#       if vowels.include?(character)
#         p character
#       end
#     end
#   end
# end

#-------------

# arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

# arr.map do |sub_arr|
#   sub_arr.sort do |first, second|
#     first <=> second
#   end
# end

#-------------

# [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
#   new_arr = {}
#   hsh.each do |key, value|
#     new_arr[key] = value + 1
#   end
#   new_arr
# end

#-------------

# arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
# new_arr = []

# arr.map do |sub_arr|
#   sub_arr.select do |num|
#     new_arr << num if num % 3 == 0
#   end
# end

#-------------

# arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# hsh = {}

# arr.each do |sub_arr|
#   hsh[sub_arr[0]] = sub_arr[0]
# end

#-------------

# arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

# arr.sort_by do |sub_arr|
#   sub_arr.select do |num|
#     num.odd?
#   end
# end

#-------------

# hsh = {
#   'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
#   'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
#   'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
#   'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
#   'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
# }

# hsh.map do |produce, details|
#   if details[:type] == 'fruit'
#     details[:colors].map do |color|
#       color.capitalize
#     end
#   elsif details[:type] == 'vegetable'
#     details[:size].upcase 
#   end
# end

#-------------

# arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

# arr.select do |hsh|
#   hsh.all? do |key, value|
#     value.all? do |num|
#       num.even?
#     end
#   end
# end

#-------------

def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end



