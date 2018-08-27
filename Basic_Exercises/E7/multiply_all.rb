def multiply_all_pairs(arr1, arr2)
  product = arr1.map do |num1|
    arr2.map do |num2|
      num1 * num2
    end
  end
  product.flatten.sort
end
