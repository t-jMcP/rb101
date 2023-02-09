def prompt(message)
  puts("=> #{message}")
end

def valid_number?(number)
  number.to_i != 0 
end


def operation_to_message(op)
  case op
    when "add" then "adding"
    when "subtract" then "subtracting"
    when "multiply" then "multiplying"
    when "divide" then "dividing"
  end 
end   

prompt("Welcome! Please enter your name:")
name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt("Please provide a name")
  else
    break
  end    
end

prompt("Hello #{name}")

# Repeat until user ends program
loop do

  number1 = ''
  # Repeat until user provides valid first number
  loop do
    
    # Get first number from user
    prompt("Please enter first number:")
    number1 = gets.chomp.to_f

    # Check number is valid
    if valid_number?(number1)
      break
    else
      prompt("Invalid input. Please provide a number")
    end    
  end

  number2 = ''
  # Repeat until user provides valid first number
  loop do

    # Get second number from user
    prompt("Please enter second number")
    number2 = gets.chomp.to_f

    # Check number is valid
    if valid_number?(number2)
      break
    else
      prompt("Invalid input. Please provide a number")
    end
  end  

  # Repeat until user provides valid operation
  loop do

    # Get operation from user
    operator_prompt = <<-MSG
      What operation would you like to perform?
      add
      subtract
      multiply
      divide
    MSG
    prompt(operator_prompt)
    operation = gets.chomp

    prompt("#{operation_to_message(operation)} the two numbers...")

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
      prompt("The result is #{result}")
      break
    else
      prompt("Invalid operation")
    end
  end

  # Check if user wants to repeat
  prompt("Do you want to perform another calculation? (Press Y to confirm)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Goodbye")