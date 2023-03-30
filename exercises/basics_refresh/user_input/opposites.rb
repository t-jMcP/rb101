def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def get_integer
  loop do
    puts ">> Please enter a positive or negative integer: "
    integer = gets.chomp
    return integer.to_i if valid_number?(integer)
    puts "Invalid number. Please enter a non-zero integer"
  end
end

integer1 = nil
integer2 = nil

loop do
  integer1 = get_integer
  integer2 = get_integer
  break if integer1 * integer2 < 0
  puts "One integer must be positive and the other negative."
end

result = integer1 + integer2
puts "#{integer1} + #{integer2} = #{result}"
