def prompt(message)
  puts("=> #{message}")
end

def valid_number?(input_string)
  (input_string.to_i.to_s == input_string && input_string.to_i > 0) ||
    (input_string.to_f.to_s == input_string && input_string.to_f > 0)
end

def valid_percentage?(input_string)
  # Remove percentage sign from input
  number = input_string.split("%")[0]
  valid_number?(number)
end

def get_loan_amount
  loan_amount = ''

  # Repeatedly prompt until user provides a valid loan amount
  loop do
    prompt("Please enter your loan amount in a number format (e.g. 100000):")
    loan_amount = gets.chomp
    if valid_number?(loan_amount) == false
      prompt("Invalid loan amount. Please provide a positive number")
    else
      break
    end
  end

  loan_amount
end

def get_apr
  apr = ''

  # Repeatedly prompt until user provides a valid percentage rate
  loop do
    prompt("Please enter your APR in a percentage format (e.g. 5%):")
    apr = gets.chomp
    if valid_percentage?(apr) == false
      prompt("Invalid APR. Please provide a percentage")
    else
      break
    end
  end

  apr
end

def get_loan_duration
  duration_years = ''

  # Repeatedly prompt until user provides a loan duration
  loop do
    prompt("Enter your loan duration in years:")
    duration_years = gets.chomp
    if valid_number?(duration_years) == false
      prompt("Invalid loan duration. Please provide a positive number")
    else
      break
    end
  end

  duration_years
end

def payment_calculation(loan_amount, apr, duration_years)
  loan_amount_float = loan_amount.to_f
  apr_decimal = apr.to_f / 100
  monthly_interest_rate = apr_decimal / 12
  duration_months = duration_years.to_f * 12

  # Formula to calculate monthly payment
  loan_amount_float *
    (monthly_interest_rate /
    (1 - (1 + monthly_interest_rate)**(-duration_months)))
end

prompt("Welcome to Mortgage Calculator!")

loop do
  loan_amount = get_loan_amount
  apr = get_apr
  duration_years = get_loan_duration

  monthly_payment = payment_calculation(loan_amount, apr, duration_years)
  prompt("Your monthly payment will be £#{format('%.2f', monthly_payment)}")

  prompt("Do you want to try again? (Enter Y to confirm)")
  repeat = gets.chomp
  if repeat != "Y"
    prompt("Goodbye!")
    break
  end
end
