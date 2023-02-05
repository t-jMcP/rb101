def third_occurence(string, character)
  string_array = string.split("")
  iterator = 0
  occurences = 0
  while iterator < string_array.length
    if string_array[iterator] == character
      occurences += 1
      return iterator if occurences == 3
    end
    iterator += 1
  end
  return nil
end

index = third_occurence('axbxcdxex', 'x')
puts index