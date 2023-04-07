def triangle(height)
  stars = height
  loop do
    puts (" " * (height-stars)) + ("*" * stars)
    stars -= 1
    break if stars == 0
  end
end

triangle(1)
triangle(5)
triangle(9)
