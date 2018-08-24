def find_dup(arr)
  arr.find do |element|
    arr.count(element) == 2
  end
end
