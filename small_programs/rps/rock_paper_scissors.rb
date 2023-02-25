OPTIONS = ["rock", "paper", "scissors", "lizard", "spock"]

RESULTS = {
  ["rock", "rock"] => "draw",
  ["rock", "paper"] => "loss",
  ["rock", "scissors"] => "win",
  ["rock", "lizard"] => "win",
  ["rock", "spock"] => "loss",
  ["paper", "rock"] => "win",
  ["paper", "paper"] => "draw",
  ["paper", "scissors"] => "loss",
  ["paper", "lizard"] => "loss",
  ["paper", "spock"] => "win",
  ["scissors", "rock"] => "loss",
  ["scissors", "paper"] => "win",
  ["scissors", "scissors"] => "draw",
  ["scissors", "lizard"] => "win",
  ["scissors", "spock"] => "loss",
  ["lizard", "rock"] => "loss",
  ["lizard", "paper"] => "win",
  ["lizard", "scissors"] => "loss",
  ["lizard", "lizard"] => "draw",
  ["lizard", "spock"] => "win",
  ["spock", "rock"] => "win",
  ["spock", "paper"] => "loss",
  ["spock", "scissors"] => "win",
  ["spock", "lizard"] => "loss",
  ["spock", "spock"] => "draw"
}

def prompt(message)
  puts "=> #{message}"
end

def display_results(user_choice, computer_choice)
  result = RESULTS[[user_choice, computer_choice]]

  if result == "win"
    prompt("You win. Congratulations!")
  elsif result == "loss"
    prompt("Computer wins. Better luck next time!")
  else
    prompt("It's a tie!")
  end
end

prompt("Welcome to Rock Paper Scissors")

loop do
  user_choice = ""
  loop do
    prompt("Please choose one of: #{OPTIONS.join(', ')}")
    user_choice = gets.chomp.downcase
    break if OPTIONS.include?(user_choice)
    prompt("That's not a valid option. Please try again")
  end

  prompt("You chose #{user_choice}")
  computer_choice = OPTIONS.sample
  prompt("Computer chose #{computer_choice}")

  display_results(user_choice, computer_choice)

  prompt("Do you want to play again? (enter 'Y' to confirm)")
  repeat = gets.chomp
  break unless repeat.downcase.start_with?('y')
end

prompt("Thanks for playing Rock Paper Scissors")
