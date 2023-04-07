puts "Enter the first number:"
number1 = gets.chomp.to_i

puts "Enter the second number:"
number2 = gets.chomp.to_i

addition = number1 + number2
puts "#{number1} + #{number2} = #{addition}"

subtraction = number1 - number2
puts "#{number1} - #{number2} = #{subtraction}"

product = number1 * number2
puts "#{number1} * #{number2} = #{product}"

quotient = number1 / number2
puts "#{number1} / #{number2} = #{quotient}"

remainder = number1 % number2
puts "#{number1} % #{number2} = #{remainder}"

power = number1 ** number2
puts "#{number1} ** #{number2} = #{power}"
