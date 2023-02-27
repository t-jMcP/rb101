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

def update_score(round_winner, scores)
  if round_winner == "user"
    scores[:user] += 1
  elsif round_winner == "computer"
    scores[:computer] += 1
  end
end

def display_results(round_winner, scores)
  if round_winner == "user"
    prompt("You win this round. Well done!")
  elsif round_winner == "computer"
    prompt("Computer wins this round. Unlucky!")
  else
    prompt("It's a tie!")
  end
  prompt("Current score: You #{scores[:user]} - Computer " \
  "#{scores[:computer]}")
end

def game_over?(scores)
  if scores[:user] == 3 || scores[:computer] == 3
    true
  else
    false
  end
end

def display_final_score(scores)
  if scores[:user] == 3
    prompt("Game over. You reached three wins first. Congratulations!")
  elsif scores[:computer] == 3
    prompt("Game over. The computer reached three wins first. " \
      "Better luck next time!")
  end
end

prompt("Welcome to Rock Paper Scissors")
scores = {
  user: 0,
  computer: 0
}

loop do
  user_choice = get_choice
  prompt("You chose #{user_choice}")

  computer_choice = OPTIONS.sample
  prompt("Computer chose #{computer_choice}")

  round_winner = determine_winner(user_choice, computer_choice)
  update_score(round_winner, scores)
  display_results(round_winner, scores)

  if game_over?(scores)
    display_final_score(scores)
    break
  end

  prompt("Do you want to keep going? (enter 'Y' to confirm)")
  repeat = gets.chomp
  break unless repeat.downcase.start_with?('y')
end

prompt("Thanks for playing Rock Paper Scissors")
