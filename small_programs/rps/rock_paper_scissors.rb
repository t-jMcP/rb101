OPTIONS = ["rock", "paper", "scissors", "lizard", "spock"]

WINNING_PAIRS = {
  "rock" => ["scissors", "lizard"],
  "paper" => ["rock", "spock"],
  "scissors" => ["paper", "lizard"],
  "lizard" => ["paper", "spock"],
  "spock" => ["rock", "scissors"]
}

def prompt(message)
  puts "=> #{message}"
end

def convert_s(user_choice)
  loop do
    prompt("Did you mean scissors or spock? Please specify")
    user_choice = gets.chomp.downcase
    break if user_choice != "s"
  end
  user_choice
end

def convert_abbreviations(user_choice)
  user_choice = convert_s(user_choice) if user_choice == "s"
  if user_choice != ""
    OPTIONS.each do |option|
      user_choice = option if option.start_with?(user_choice)
    end
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
  if WINNING_PAIRS[user_choice].include?(computer_choice)
    :user
  elsif WINNING_PAIRS[computer_choice].include?(user_choice)
    :computer
  else
    :tie
  end
end

def update_score(round_winner, scores)
  scores[round_winner] += 1 unless round_winner == :tie
end

def display_results(round_winner, scores)
  if round_winner == :user
    prompt("You win this round. Well done!")
  elsif round_winner == :computer
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

prompt("Welcome to Rock Paper Scissors. First to three rounds wins")

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
    prompt("Do you want to play again? (enter 'Y' to confirm)")
    repeat = gets.chomp
    break unless repeat.downcase.start_with?('y')

    scores[:user] = 0
    scores[:computer] = 0
  end
end

prompt("Thanks for playing Rock Paper Scissors")
