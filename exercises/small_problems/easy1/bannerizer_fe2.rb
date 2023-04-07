def print_in_box(text)
  inside_width = text.length > 76 ? 78 : text.length + 2
  border = "+" + "-"*inside_width + "+"
  empty_line = "|" + " "*inside_width + "|"

  puts border
  puts empty_line
  
  text_lines = text.length / 76
  text_lines.times do
    substring = text.slice!(0, 76)
    puts "| " + substring + " |"
  end

  puts "| " + text.center(inside_width - 2) + " |"

  puts empty_line
  puts border
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
print_in_box('In a hole in the ground there lived a hobbit. Not a nasty, dirty, wet hole, filled with the ends of worms and an oozy smell, nor yet a dry, bare,sandy hole with nothing in it to sit down on or to eat: it was a hobbit-hole, and that means comfort.')
