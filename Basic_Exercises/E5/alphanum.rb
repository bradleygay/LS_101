NUM_WORD = %w(zero one two three four five six seven
              eight nine ten eleven twelve thirdteen
              fourteen fifteen sixteen seventeen
              eighteen nineteen)

def alphabetic_number_sort(arr)
  arr.sort_by do |num|
    NUM_WORD[num]
  end
end
