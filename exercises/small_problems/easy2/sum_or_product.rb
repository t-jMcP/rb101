puts "Please enter a positive integer"
number = gets.chomp.to_i

puts "Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp

if operation == 's'
  sum = 0
  1.upto(number) do |x|
    sum += x
  end
  puts "The sum of the integers between 1 and #{number} is #{sum}"

elsif operation == 'p'
  product = 1

  1.upto(number) do |x|
    product *= x
  end

  puts "The product of the integers between 1 and #{number} is #{product}"

else
  puts "Error"
end
