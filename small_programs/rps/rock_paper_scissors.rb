OPTIONS = ["rock", "paper", "scissors", "lizard", "spock"]

WINNERS = {
  rock: ["scissors", "lizard"],
  paper: ["rock", "spock"],
  scissors: ["paper", "lizard"],
  lizard: ["paper", "spock"],
  spock: ["rock", "scissors"]
}

def prompt(message)
  puts "=> #{message}"
end

def convert_abbreviations(user_choice)
  # Store first letter of each option
  abbreviations = []
  OPTIONS.each{|option| abbreviations << option[0]}

  # Reprompt user if it's not clear whether they meant scissors or spock
  if user_choice == "s"
    prompt("Did you mean scissors or spock? Please specify")
    user_choice = gets.chomp.downcase
  
  # If user provided valid abbreviation, convert to full answer   
  elsif abbreviations.include?(user_choice)
    user_choice = OPTIONS[abbreviations.find_index(user_choice)]
  end
  user_choice
end

def get_choice
  user_choice = ""

  loop do
    prompt("Please choose one of: #{OPTIONS.join(', ')}")
    user_choice = convert_abbreviations(gets.chomp.downcase)
    break if OPTIONS.include?(user_choice)
    prompt("That's not a valid option. Please try again")
  end

  user_choice
end

def display_results(user_choice, computer_choice)
  if WINNERS[user_choice.to_sym].include?(computer_choice)
    prompt("You win. Congratulations!")
  elsif WINNERS[computer_choice.to_sym].include?(user_choice)
    prompt("Computer wins. Better luck next time!")
  else
    prompt("It's a tie!")
  end
end

prompt("Welcome to Rock Paper Scissors")

loop do
  user_choice = get_choice
  prompt("You chose #{user_choice}")

  computer_choice = OPTIONS.sample
  prompt("Computer chose #{computer_choice}")

  display_results(user_choice, computer_choice)

  prompt("Do you want to play again? (enter 'Y' to confirm)")
  repeat = gets.chomp
  break unless repeat.downcase.start_with?('y')
end

prompt("Thanks for playing Rock Paper Scissors")
