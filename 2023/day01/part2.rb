#!/usr/bin/env ruby

def numerals(line)
  line.each_char.with_index.map do |c, i|
    slice = line[i..-1]

    if slice.start_with?("one") || line[i] == "1"
      1
    elsif slice.start_with?("two") || line[i] == "2"
      2
    elsif slice.start_with?("three") || line[i] == "3"
      3
    elsif slice.start_with?("four") || line[i] == "4"
      4
    elsif slice.start_with?("five") || line[i] == "5"
      5
    elsif slice.start_with?("six") || line[i] == "6"
      6
    elsif slice.start_with?("seven") || line[i] == "7"
      7
    elsif slice.start_with?("eight") || line[i] == "8"
      8
    elsif slice.start_with?("nine") || line[i] == "9"
      9
    end
  end
end

pp ARGF.read
     .split("\n")
     .map {|l| numerals(l) }
     .map {|n| "#{n.compact.first}#{n.compact.last}" }
     .map(&:to_i)
     .sum
