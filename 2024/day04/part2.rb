#!/usr/bin/env ruby

count = 0
input = ARGF.read

m, a, s = [], [], []

input.each_line.with_index do |line, i|
  line.each_char.with_index do |char, j|
    case char
    when "M"
      m << [i, j]
    when "A"
      a << [i, j]
    when "S"
      s << [i, j]
    end
  end
end

a.each do |x2, y2|
  # M.S
  # .A.
  # M.S
  if m.find {|i, j| i == x2 - 1 && j == y2 - 1 } && s.find{|i, j| i == x2 + 1 && j == y2 - 1 } && m.find{|i, j| i == x2 - 1 && j == y2 + 1 } && s.find{|i, j| i == x2 + 1 && j == y2 + 1 }
    count += 1
  end

  # S.M
  # .A.
  # S.M
  if s.find {|i, j| i == x2 - 1 && j == y2 - 1 } && m.find{|i, j| i == x2 + 1 && j == y2 - 1 } && s.find{|i, j| i == x2 - 1 && j == y2 + 1 } && m.find{|i, j| i == x2 + 1 && j == y2 + 1 }
    count += 1
  end

  # S.S
  # .A.
  # M.M
  if s.find {|i, j| i == x2 - 1 && j == y2 - 1 } && s.find{|i, j| i == x2 + 1 && j == y2 - 1 } && m.find{|i, j| i == x2 - 1 && j == y2 + 1 } && m.find{|i, j| i == x2 + 1 && j == y2 + 1 }
    count += 1
  end

  # M.M
  # .A.
  # S.S
  if m.find {|i, j| i == x2 - 1 && j == y2 - 1 } && m.find{|i, j| i == x2 + 1 && j == y2 - 1 } && s.find{|i, j| i == x2 - 1 && j == y2 + 1 } && s.find{|i, j| i == x2 + 1 && j == y2 + 1 }
    count += 1
  end
end

pp count
