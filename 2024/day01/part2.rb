#!/usr/bin/env ruby

# Calculate a total similarity score by adding up each number in the left list
# after multiplying it by the number of times that number appears in the right list.

sum = 0
left = []
right = []

ARGF.read
    .split("\n")
    .each {|l| n = l.split.map(&:to_i); left << n[0]; right << n[1] }

left.each do |l|
  times = right.count(l)

  sum += l * times
end

puts sum
