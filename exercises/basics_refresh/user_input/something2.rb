answer = ""

loop do
  puts ">> Do you want me to print something? (y/n)"
  answer = gets.chomp.downcase
  break if answer == "y" || answer == "n"
  puts ">> Invalid input. Please try again"
end

puts ">> Something" if answer == "y"
