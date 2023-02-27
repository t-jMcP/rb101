OPTIONS = ["rock", "paper", "scissors", "lizard", "spock"]

WINNING_PAIRS = {
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
  OPTIONS.each { |option| abbreviations << option[0] }

  # Reprompt user if it's not clear whether they meant scissors or spock
  if user_choice == "s"
    prompt("Did you mean scissors or spock? Please specify")
    user_choice = gets.chomp.downcase

  # Convert valid abbreviations to full answer
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

def determine_winner(user_choice, computer_choice)
  if WINNING_PAIRS[user_choice.to_sym].include?(computer_choice)
    "user"
  elsif WINNING_PAIRS[computer_choice.to_sym].include?(user_choice)
    "computer"
  else
    "tie"
  end
end

def display_results(round_winner)
  if round_winner == "user"
    prompt("You win this round. Keep it up!")
  elsif round_winner == "computer"
    prompt("Computer wins this round. Better luck next time!")
  else
    prompt("It's a tie!")
  end
end

def update_score(round_winner, user_wins, computer_wins)
  if round_winner == "user"
    user_wins << true
  elsif round_winner == "computer"
    computer_wins << true
  end
end

def game_over?(user_wins, computer_wins)
  if user_wins.length == 3 || computer_wins.length == 3
    true
  else
    false
  end
end

def display_final_score(user_wins, computer_wins)
  if user_wins.length == 3
    prompt("Game over, you reached three wins first. Congratulations!")
  elsif computer_wins.length == 3
    prompt("Game over, the computer reached three wins first. Unlucky!")
  end
end

prompt("Welcome to Rock Paper Scissors")
user_wins = []
computer_wins = []

loop do
  user_choice = get_choice
  prompt("You chose #{user_choice}")

  computer_choice = OPTIONS.sample
  prompt("Computer chose #{computer_choice}")

  round_winner = determine_winner(user_choice, computer_choice)
  display_results(round_winner)
  update_score(round_winner, user_wins, computer_wins)

  if game_over?(user_wins, computer_wins)
    display_final_score(user_wins, computer_wins)
    break
  end

  prompt("Do you want to keep going? (enter 'Y' to confirm)")
  repeat = gets.chomp
  break unless repeat.downcase.start_with?('y')
end

prompt("Thanks for playing Rock Paper Scissors")
