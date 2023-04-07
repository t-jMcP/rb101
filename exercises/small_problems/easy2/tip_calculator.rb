print "What is the bill? "
bill = gets.chomp.to_f

print "What is the tip percentage? "
tip_percent = gets.chomp.to_f


tip_amount = (tip_percent / 100 * bill).round(2)
puts "The tip is $#{tip_amount}"

total = (bill + tip_amount).round(2)
puts "The total is $#{total}"

