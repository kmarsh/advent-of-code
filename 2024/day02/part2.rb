#!/usr/bin/env ruby

sum = 0

def safe?(levels)
  all_increasing_or_decreasing = levels.each_cons(2)
                                       .map {|l, r| l < r ? :increasing : :decreasing }
  all_increasing = all_increasing_or_decreasing.all? {|l| l == :increasing }
  all_decreasing = all_increasing_or_decreasing.all? {|l| l == :decreasing }

  adjacent_difference_ok = levels.each_cons(2)
               .map {|l, r| (l - r).abs }
               .tap {|f| p = f }
               .all? {|i| i >= 1 && i <= 3 }

  adjacent_difference_ok && (all_increasing || all_decreasing)
end

ARGF.read
    .split("\n")
    .each do |line|
      levels = line.split.map(&:to_i)
      # The levels are either all increasing or all decreasing.
      # Any two adjacent levels differ by at least one and at most three.

      # ...except if removing a single level from an unsafe report would make it
      # safe, the report instead counts as safe.

      safe = safe?(levels)

      if !safe
        # try removing each level and try again
        safe_without = levels.map
                             .with_index do |l, i|
                               without = levels.reject.with_index { |_, index| index == i }
                               safe?(without)
                             end

        safe = safe_without.any?
      end

      pp [levels, safe ? "Safe" : "Unsafe"]

      sum += 1 if safe
    end

puts sum
