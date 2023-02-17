def valid_number?(input_string)
  # Check for valid number greater than 0
  input_string.to_i.to_s == input_string && input_string.to_i > 0
end

def valid_percentage?(input_string)
  # Remove percentage sign from input
  number = input_string.split("%")[0]

  # Check for valid number
  if valid_number?(number)
    true
  else
    false
  end
end

def payment_calculation(loan_amount, apr, duration_years)
  # Convert loan amount to integer
  loan_amount_integer = loan_amount.to_i

  # Convert APR to decimal
  apr_decimal = apr.to_f / 100

  # Convert from annual to monthly interest rate
  monthly_interest_rate = apr_decimal / 12

  # Convert loan duration to months
  duration_months = duration_years.to_i * 12

  # Calculate and return monthly payment
  loan_amount_integer * (monthly_interest_rate /
  (1 - (1 + monthly_interest_rate)**(-duration_months)))
end

# Print welcome message
puts "Welcome to Mortgage Calculator!"

# Repeat until user ends the program
loop do
  loan_amount = ''
  # Repeat until user provides a valid loan amount
  loop do
    puts "Please enter your loan amount in GBP as a whole number (e.g. 100000):"
    loan_amount = gets.chomp

    # Check loan amount is a valid number
    if valid_number?(loan_amount) == false
      puts "Invalid loan amount. Please provide a positive number"
    else
      break
    end
  end

  apr = ''
  # Repeat until user provides a valid APR
  loop do
    puts "Please enter your APR in a percentage format (e.g. 5%):"
    apr = gets.chomp

    # Check APR is a valid percentage
    if valid_percentage?(apr) == false
      puts "Invalid APR. Please provide a percentage"
    else
      break
    end
  end

  duration_years = ''
  # Repeat until user provides a valid loan duration
  loop do
    puts "Enter your loan duration in years, rounding to the nearest year:"
    duration_years = gets.chomp

    # Check loan duration is a valid number
    if valid_number?(duration_years) == false
      puts "Invalid loan duration. Please provide a positive number"
    else
      break
    end
  end

  # Calculate monthly payment
  monthly_payment = payment_calculation(loan_amount, apr, duration_years)
  puts "Your monthly payment will be £#{monthly_payment}"

  # Check if user wants to repeat
  puts "Do you want to try again? (Enter Y to confirm)"
  repeat = gets.chomp
  if repeat != "Y"
    puts "Goodbye!"
    break
  end
end