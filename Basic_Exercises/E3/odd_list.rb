def oddities(arr)
  new_arr = []
  arr.each.with_index do |item, idx|
    new_arr << item if idx == 0 || idx.even?
  end
  new_arr
end

#-------------

def oddities2(arr)
  arr.select.with_index do |element, idx|
    idx.even? || idx == 0
  end
end
