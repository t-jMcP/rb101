def time_of_day(daylight)
  string = daylight ? "It's daytime!" : "It's nighttime!"
  puts string
end

daylight = [true, false].sample
time_of_day(daylight)
