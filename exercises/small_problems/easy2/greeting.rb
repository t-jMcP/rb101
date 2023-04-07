puts "What is your name?"
name = gets.chomp

if name.end_with?("!")
  name = name.slice(0, name.index("!")).upcase
  puts "HELLO #{name}!!!"
else
  puts "Hello #{name}"
end    
