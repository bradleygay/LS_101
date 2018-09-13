def balanced?(str)
  counter = 0
  str.chars.map do |char|
    if "(".include?(char)
      counter += 1
    elsif ")".include?(char)
      counter -= 1
    break if counter < 0
    end
  end
  counter.zero?
end
