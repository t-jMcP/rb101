require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'

# Method to access a message in user's language
def messages(message, lang=LANGUAGE)
  MESSAGES[lang][message]
end

# Method to format the message prompt 
def prompt(message)
  puts("=> #{message}")
end

# Method to check a valid number (integer or float) is provided
def valid_number?(number)
  number.to_i.to_s == number || number.to_f.to_s == number
end

# method to convert operation into message
def operation_to_message(op)
  case op
  when "add" then "adding"
  when "subtract" then "subtracting"
  when "multiply" then "multiplying"
  when "divide" then "dividing"
  end
end

# Get user's name
prompt(messages('name_prompt'))
name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt(messages('name_reprompt'))
  else
    break
  end
end

# Send greeting message
prompt(messages('greeting') + " #{name}")

# Repeat until user ends program
loop do
  number1 = ''
  # Repeat until user provides valid first number
  loop do
    # Get first number from user
    prompt(messages('number1_prompt'))
    number1 = gets.chomp

    # Check number is valid
    if valid_number?(number1)
      number1 = number1.to_f
      break
    else
      prompt(messages('invalid_number'))
    end
  end

  number2 = ''
  # Repeat until user provides valid first number
  loop do
    # Get second number from user
    prompt(messages('number2_prompt'))
    number2 = gets.chomp

    # Check number is valid
    if valid_number?(number2)
      number2 = number2.to_f
      break
    else
      prompt(messages('invalid_number'))
    end
  end

  # Repeat until user provides valid operation
  loop do
    # Get operation from user
    prompt(messages('operation_prompt'))
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
      prompt("#{operation_to_message(operation)}" + messages('operating_message'))
      prompt(messages('result') + "#{result}")
      break
    else
      prompt(messages('invalid_operation'))
    end
  end

  # Check if user wants to repeat
  prompt(messages('repeat_prompt'))
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(messages('goodbye'))