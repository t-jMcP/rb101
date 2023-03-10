# My solution
(0..9).each{|n| puts "The Flintstones Rock!".center("The Flintstones Rock!".length + n * 2)}

# Given solution
10.times { |number| puts (" " * number) + "The Flintstones Rock!" }
