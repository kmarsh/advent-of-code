#!/usr/bin/env ruby

sum = 0

ARGF.read
    .split("\n")
    .each do |line|
      levels = line.split.map(&:to_i)
      # The levels are either all increasing or all decreasing.
      # Any two adjacent levels differ by at least one and at most three.

      p = nil

      all_increasing_or_decreasing = levels.each_cons(2)
                                           .map{|l, r| l < r ? :increasing : :decreasing }
      all_increasing = all_increasing_or_decreasing.all?{|l| l == :increasing }
      all_decreasing = all_increasing_or_decreasing.all?{|l| l == :decreasing }

      adjacent_difference_ok = levels.each_cons(2)
                   .map {|l, r| (l - r).abs }
                   .tap {|f| p = f }
                   .all? {|i| i >= 1 && i <= 3 }

      safe = adjacent_difference_ok && (all_increasing || all_decreasing)

      pp [levels, safe ? "Safe" : "Unsafe"]

      sum += 1 if safe
    end

puts sum
