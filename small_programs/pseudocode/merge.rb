def merge(array1, array2)
  iterator = 0
  merged_array = []
  while iterator < array1.length
    merged_array.push(array1[iterator])
    merged_array.push(array2[iterator])
    iterator += 1
  end
  merged_array
end

array = merge([1, 2, 3], [4, 5, 6])
p array