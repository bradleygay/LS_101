require 'pry'

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

def count_occurrences(array)
  vehicles_hash = {}
  array.each do |element|
    vehicles_hash[element] = array.count(element)
  end
  vehicles_hash.each do |element, count|
    p "#{element} => #{count}"
  end
end

count_occurrences(vehicles)