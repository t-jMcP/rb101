# Get first number from user
puts "Please enter first number:"
number1 = gets.chomp.to_f

# Get second number from user
puts "Please enter second number:"
number2 = gets.chomp.to_f

# Repeat until user provides valid operation
loop do

  # Get operation from user
  puts "Please enter operation:"
  operation = gets.chomp

  # Perform selected operation and store result
  result = case operation
    when "add" then number1 + number2
    when "subtract" then number1 - number2  
    when "multiply" then number1 * number2
    when "divide" then number1 / number2
    else "error"  
  end

  # Print valid result
  if result != "error"
    puts result
    break
  else
    puts "Invalid operation"
  end
end