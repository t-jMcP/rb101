print "What is your age? "
current_age = gets.chomp.to_i

print "At what age would you like to retire? "
retirement_age = gets.chomp.to_i

current_year = Time.now.year
retirement_year = current_year + retirement_age - current_age
years_to_retire = retirement_year - current_year

puts "It's #{current_year}. You will retire in #{retirement_year}"
puts "You have #{years_to_retire} years to go"
