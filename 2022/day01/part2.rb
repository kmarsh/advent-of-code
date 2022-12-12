#!/usr/bin/env ruby

# Find the top three Elves carrying the most Calories.
# How many Calories are those Elves carrying in total?

puts ARGF.read
         .split("\n\n")
         .map {|elf| elf.split("\n").map(&:to_i) }
         .map(&:sum)
         .sort
         .reverse
         .take(3)
         .sum
