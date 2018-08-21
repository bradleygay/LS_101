def running_total(arr)
  sum = 0
  arr.map do |num|
    sum += num
  end
end

def running_total(arr)
  arr.map.with_index do |num, idx|
    arr[0..idx].reduce(:+)
  end
end
