def repeat(message, repetitions)
  if repetitions.is_a?(Integer) && repetitions > 0
    repetitions.times{ puts message }
  else
    puts "Error. Requires a positive integer for times to print message"
  end
end

repeat('Hello', 3)
repeat('Goodbye', 2)
repeat(17, 3)
