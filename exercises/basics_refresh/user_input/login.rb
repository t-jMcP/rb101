USER_NAME = "admin"
PASSWORD = "SecreT"

loop do
  puts ">> Please enter your user name: "
  user_name_attempt = gets.chomp
  puts ">> Please enter your password: "
  password_attempt = gets.chomp
  break if user_name_attempt == USER_NAME && password_attempt == PASSWORD
  puts "Invalid login details."
end

puts "Welcome!"
