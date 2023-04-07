def stringy(length, start = 1)
  sequence = []
  second = start == 1 ? 0 : 1

  length.times do |index|
    number = index.even? ? start : second
    sequence << number
  end

  sequence.join
end

puts stringy(6) == '101010'
puts stringy(9, 0) == '010101010'
puts stringy(4) == '1010'
puts stringy(7, 0) == '0101010'
