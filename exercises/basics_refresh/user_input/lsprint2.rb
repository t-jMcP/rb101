loop do
  puts ">> How many output lines do you want? Enter a number >= 3 (Q to quit)"
  lines = gets.chomp
  break if lines.downcase == "q"
  if lines.to_i < 3
    puts ">> That's not enough lines"
  else
    lines.to_i.times{puts "Launch School is the best!"}
  end
end    
