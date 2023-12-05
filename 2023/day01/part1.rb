#!/usr/bin/env ruby

sum = 0

ARGF.read
     .split("\n")
     .map {|l| l.scan(/\d/).map(&:to_i).flatten }
     .each do |line|
        sum += "#{line[0]}#{line[-1]}".to_i
      end

puts sum
