#!/usr/bin/env ruby

count = 0
input = ARGF.read

x, m, a, s = [], [], [], []

# This word search allows words to be horizontal, vertical, diagonal, written
# backwards, or even overlapping other words.

input.each_line.with_index do |line, i|
  line.each_char.with_index do |char, j|
    case char
    when "X"
      x << [i, j]
    when "M"
      m << [i, j]
    when "A"
      a << [i, j]
    when "S"
      s << [i, j]
    end
  end
end

x.each do |x2, y2|
  # check for horizontal
  # ......
  # .XMAS.
  if m.find {|i, j| i == x2 + 1 && j == y2 } && a.find{|i, j| i == x2 + 2 && j == y2 } && s.find{|i, j| i == x2 + 3 && j == y2 }
    count += 1
  end

  # check for vertical
  # ...X..
  # ...M..
  # ...A..
  # ...S..
  if m.find {|i, j| i == x2 && j == y2 + 1 } && a.find{|i, j| i == x2 && j == y2 + 2 } && s.find{|i, j| i == x2 && j == y2 + 3 }
    count += 1
  end

  # check for horizonal backwards
  # .SAMX.
  if m.find {|i, j| i == x2 - 1 && j == y2 } && a.find{|i, j| i == x2 - 2 && j == y2 } && s.find{|i, j| i == x2 - 3 && j == y2 }
    count += 1
  end

  # check for diagonal (to bottom right)
  # .X.....
  # ..M....
  # ...A...
  # ....S..
  if m.find {|i, j| i == x2 + 1 && j == y2 + 1 } && a.find{|i, j| i == x2 + 2 && j == y2 + 2 } && s.find{|i, j| i == x2 + 3 && j == y2 + 3 }
    count += 1
  end

  # check for diagonal (to bottom left)
  # .....X.
  # ....M..
  # ...A...
  # ..S....
  if m.find {|i, j| i == x2 - 1 && j == y2 + 1 } && a.find{|i, j| i == x2 - 2 && j == y2 + 2 } && s.find{|i, j| i == x2 - 3 && j == y2 + 3 }
    count += 1
  end

  # check for diagonal (to upper right)
  # .....S.
  # ....A..
  # ...M...
  # ..X....
  if m.find {|i, j| i == x2 + 1 && j == y2 - 1 } && a.find{|i, j| i == x2 + 2 && j == y2 - 2 } && s.find{|i, j| i == x2 + 3 && j == y2 - 3 }
    count += 1
  end

  # check for diagonal (to upper left)
  # .S.....
  # ..A....
  # ...M...
  # ....X..
  if m.find {|i, j| i == x2 - 1 && j == y2 - 1 } && a.find{|i, j| i == x2 - 2 && j == y2 - 2 } && s.find{|i, j| i == x2 - 3 && j == y2 - 3 }
    count += 1
  end

  # check for vertical backwards
  # ...S..
  # ...A..
  # ...M..
  # ...X..
  if m.find {|i, j| i == x2 && j == y2 - 1 } && a.find{|i, j| i == x2 && j == y2 - 2 } && s.find{|i, j| i == x2 && j == y2 - 3 }
    count += 1
  end
end

pp count
