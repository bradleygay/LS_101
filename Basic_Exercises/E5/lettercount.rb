def word_sizes(str)
  hsh = {}
  arr = str.split.map { |word| word.length }
  arr.each do |num|
    hsh[num] = arr.count(num)
  end
  hsh
end
