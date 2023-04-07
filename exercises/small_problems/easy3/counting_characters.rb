print "Please write a word or multiple words: "
text = gets.chomp
characters = text.delete(" ")
puts "There are #{characters.length} characters in '#{text}'"
