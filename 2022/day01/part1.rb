#!/usr/bin/env ruby

# Find the Elf carrying the most Calories.
# How many total Calories is that Elf carrying?

puts ARGF.read
        .split("\n\n")
        .map {|elf| elf.split("\n").map(&:to_i) }
        .map(&:sum)
        .max
