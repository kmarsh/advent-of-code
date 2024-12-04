#!/usr/bin/env ruby

sum = 0
enabled = true

ARGF.read
    .scan(/(mul\((\d+),(\d+)\))|(do\(\))|don't(\(\))/)
    .each do |i|
      if enabled && i[1] && i[2]
        sum += (i[1].to_i * i[2].to_i)
      elsif i[4]
        enabled = false
      elsif i[3]
        enabled = true
      end
    end

puts sum
