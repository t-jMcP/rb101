def reversed_number(number)
  string_number = number.to_s
  reversed_string = string_number.reverse
  reversed_number = reversed_string.to_i
end

puts reversed_number(12345) == 54321
puts reversed_number(12213) == 31221
puts reversed_number(456) == 654
puts reversed_number(12000) == 21 # No leading zeros in return value!
puts reversed_number(12003) == 30021
puts reversed_number(1) == 1
