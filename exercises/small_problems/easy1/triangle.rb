def triangle(height)
  stars = 1
  loop do
    puts (" " * (height-stars)) + ("*" * stars)
    stars += 1
    break if stars > height
  end
end

triangle(1)
triangle(5)
triangle(9)
