def print_in_box(text)
  text = text.slice(0, 76) 

  border = "+" + "-"*(text.length + 2) + "+"
  empty_line = "|" + " "*(text.length + 2) + "|"
  text_line = "| " + text + " |"

  puts border
  puts empty_line
  puts text_line
  puts empty_line
  puts border
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
print_in_box('In a hole in the ground there lived a hobbit. Not a nasty, dirty, wet hole, filled with the ends of worms and an oozy smell, nor yet a dry, bare,sandy hole with nothing in it to sit down on or to eat: it was a hobbit-hole, and that means comfort.')
