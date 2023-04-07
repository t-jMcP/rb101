# takes an integer for the triangle hight and array to indicate the corner of the right angle (e.g. ["top", "right"])
def triangle(height, corner = %w(top right))
  height.times do |line_index|
    stars = case corner[0]
            when "bottom" then 1 + line_index
            when "top" then height - line_index
            else nil
            end

    puts case corner[1]
         when "right" then (" " * (height-stars)) + ("*" * stars)
         when "left" then ("*" * stars) + (" " * (height-stars))
         else nil
         end
  end
end

triangle(1, ["top", "right"])
triangle(5, ["bottom", "right"])
triangle(5, ["top", "left"])
triangle(9, ["bottom", "left"])
triangle(9, ["top", "right"])
