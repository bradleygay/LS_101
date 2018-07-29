arr = ['10', '11', '9', '7', '8']

arr.sort do |a, b|
  b <=> a
end

# WRONG
# arr.sort { |a, b| b.to_i <=> a.to_i }

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books.sort_by do |hsh|
  hsh[:published]
end

# CORRECT

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
arr3 = [['abc'], ['def'], {third: ['ghi']}]
hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

arr1[2][1][3]
arr2[1][:third][0]
arr3[2][:third][0][0]
hsh1['b'][1]
hsh2[:third].key(0)

# CORRECT

arr1 = [1, [2, 3], 4]
arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
hsh1 = {first: [1, 2, [3]]}
hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

arr1[1][1] = 4
arr1
arr2[2] = 4
arr2
hsh1[:first][2][0] = 4
hsh1
hsh2[['a']][:a][2] = 4
hsh2

# CORRECT

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_age = 0

munsters.each do |first_name, details|
  if details['gender'] == 'male'
    total_age += details['age']
  end
end

total_age

# CORRECT

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |first_name, details|
  p "#{first_name} is a #{details['age']}-year-old #{details['gender']}."
end

# CORRECT

a = 2
b = [5, 8]
arr = [a, b]
arr[0] += 2
arr[1][0] -= a

a # => 2
b # => [3,8]

# CORRECT

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = "aeiouy"

hsh.each do |key, arr|
  arr.each do |word|
    word.chars.each do |letter|
      if vowels.include? (letter) # REMEMBER THIS CONFIGURATION
        puts letter
      end
    end
  end
end

# CORRECT

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map do |sub_arr|
  sub_arr.sort do |a,b|
    b <=> a
  end
end

# CORRECT

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  new_hsh = {}
  hsh.each do |key, value|
    new_hsh[key] = value + 1
  end
  new_hsh
end

# REMEMBER

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr.map do |sub_arr|
  new_arr = []
  sub_arr.select do |number|
    if number % 3 == 0
      new_arr << number
    end
  end
  new_arr
end

# arr.map do |element|
# element.select do |num|
# num % 3 == 0
# end
# end

# CORRECT

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
hsh = {}

arr.each do |sub_arr|
  hsh[sub_arr[0]] = sub_arr[1]
end

# REMEMBER

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

arr.sort_by do |sub_arr|
  sub_arr.select do |num|
    num.odd?
  end
end

# REMEMBER

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

hsh.map do |key, sub_hsh|
  if sub_hsh[:type] == 'fruit'
    sub_hsh[:colors].map do |color|
      color.capitalize
    end
  elsif sub_hsh[:type] == 'vegetable'
    sub_hsh[:size].upcase
  end
end

# REMEMBER

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr.select do |sub_hsh|
  sub_hsh.all? do |key, value|
    value.all? do |num|
      num.even?
    end
  end
end

# REMEMBER

def uuid_create
  characters = []
  (0..9).each do |digit|
    characters << digit.to_s
  end
  ('a'..'z').each do |letter|
    characters << letter
  end
  uuid = ""
  partitions = [8, 4, 4, 4, 12]
  partitions.each_with_index do |partition, idx|
    partition.times do
      uuid += characters.sample
    end
    uuid += '-' unless idx >= partitions.size - 1
  end
  uuid
end

# REMEMBER
