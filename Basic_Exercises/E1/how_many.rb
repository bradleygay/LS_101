def count_occurrences(arr)
  hsh = Hash.new(0)
  arr.each do |element|
    hsh[element] += 1
  end
  hsh.each do |k, v|
    p "#{k} => #{v}"
  end
end
