def transpose(arr)
  arr.map.with_index do |_, idx|
    [arr[0][idx], arr[1][idx], arr[2][idx]]
  end
end
