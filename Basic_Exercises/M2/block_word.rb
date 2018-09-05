BLOCK_HASH = { :B => 'O', :X => 'K', :D => 'Q', :C => 'P', :N => 'A', :G => 'T',
               :R => 'E', :F => 'S', :J => 'W', :H => 'U', :V => 'I', :L => 'Y', :Z => 'M'
              }

def block_word?(str)
  arr = str.upcase.chars
  arr.each do |letter|
    return false if arr.include?(BLOCK_HASH[letter.to_sym]) || arr.include?(BLOCK_HASH.invert[letter.to_sym])
  end
  true
end

#-------------

BLOCK = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).map! { |pair| pair.chars }.freeze

def block_word?(str)
  str.upcase!
  BLOCK.each do |sub_arr|
    return false if str.include?(sub_arr[0]) && str.include?(sub_arr[1])
  end
  true
end
