def center_of(text)
  length = text.length
  middle = length / 2
  if length % 2 == 0
    center = text[middle - 1] + text[middle]
  else
    center = text[middle]
  end
end


puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'
