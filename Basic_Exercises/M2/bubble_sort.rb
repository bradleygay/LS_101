def swap!(arr, num1, num2)
  arr[num1], arr[num2] = arr[num2], arr[num1]
end

def bubble_sort!(arr)
  pair_iterations = arr.size - 1
  loop do
    interchanged = false
    pair_iterations.times do |idx|
      if arr[idx] > arr[idx + 1]
        swap!(arr, idx, idx + 1)
        interchanged = true
      end
    end
    break unless interchanged
    pair_iterations -= 1
    break if pair_iterations <= 0
  end
  arr
end
