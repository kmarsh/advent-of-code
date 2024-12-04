#!/usr/bin/env ruby

sum = 0

pp ARGF.read
    .scan(/mul\((\d+),(\d+)\)/)
    .map{|l, r| l.to_i * r.to_i }
    .sum
