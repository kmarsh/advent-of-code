#!/usr/bin/env ruby

sum = 0
left = []
right = []

ARGF.read
    .split("\n")
    .each {|l| n = l.split.map(&:to_i); left << n[0]; right << n[1] }

left.sort!
right.sort!

left.each_with_index do |l, i|
  r = right[i]

  sum += (r - l).abs
end

puts sum
