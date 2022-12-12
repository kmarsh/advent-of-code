#!/usr/bin/env ruby

MOVES = {
  "A" => :rock,
  "B" => :paper,
  "C" => :scissors,
  "X" => :rock,
  "Y" => :paper,
  "Z" => :scissors,
}

SCORES = {
  rock: 1,
  paper: 2,
  scissors: 3,
}.freeze

def score(opponent, me)
  # Rock defeats Scissors, Scissors defeats Paper, and Paper defeats Rock.
  # If both players choose the same shape, the round instead ends in a draw.

  shape_score = SCORES[me]
  win_score = if opponent == me
                # Draw
                3
              elsif (me == :rock && opponent == :scissors) || (me == :scissors && opponent == :paper) || (me == :paper && opponent == :rock)
                # Win
                6
              else
                # Lose
                0
              end

  shape_score + win_score
end

total_score = 0

ARGF.each_line do |line|
  # The score for a single round is the score for the shape you selected
  # (1 for Rock, 2 for Paper, and 3 for Scissors) plus the score for the
  # outcome of the round (0 if you lost, 3 if the round was a draw, and 6 if you won).

  encryped_moves = line.chomp.split
  opponent_move = MOVES[encryped_moves[0]]
  my_move = MOVES[encryped_moves[1]]
  this_round_score = score(opponent_move, my_move)

  total_score += this_round_score
end

puts total_score

__END__
A Y
B X
C Z
