puts "Please enter a name:"
name = gets.chomp
name = "Teddy" if name.empty?

age = Array(20..200).sample
puts "#{name} is #{age} years old"
