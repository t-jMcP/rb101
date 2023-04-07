numbers = []
prompts = ["1st", "2nd", "3rd", "4th", "5th"]

prompt = 0

loop do
  puts "Enter the #{prompts[prompt]} number"
  numbers << gets.chomp.to_i
  prompt += 1
  break if prompt == prompts.length
end

puts "Enter the last number"
last_number = gets.chomp.to_i

if numbers.include?(last_number)
  puts "The number #{last_number} appears in #{numbers}"
else
  puts "The number #{last_number} does not appear in #{numbers}"
end  
