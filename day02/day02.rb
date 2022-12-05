games = File.readlines("./input.txt", chomp: true).map do |game|
  game.split(' ')
end

plays_attr = {
  'A' => {
    sign: 'rock'
  },
  'B' => {
    sign: 'paper'
  },
  'C' => {
    sign: 'scissors'
  },
  'X' => {
    sign: 'rock',
    pts: 1
  },
  'Y' => {
    sign: 'paper',
    pts: 2
  },
  'Z' => {
    sign: 'scissors',
    pts: 3
  }
}

score = 0

games.each do |game|

  elf = plays_attr[game[0]]

  me = plays_attr[game[1]]

  score += me[:pts]

  if me[:sign] == elf[:sign]
    score += 3
  elsif me[:sign] == 'rock' && elf[:sign] == 'scissors'
    score += 6
  elsif me[:sign] == 'paper' && elf[:sign] == 'rock'
    score += 6
  elsif me[:sign] == 'scissors' && elf[:sign] == 'paper'
    score += 6
  end
end

puts score

# A X rock = 1
# B Y paper = 2
# C Z scissors = 3

# This strategy guide predicts and recommends the following:

# In the first round, your opponent will choose Rock (A), and you should choose Paper (Y). This ends in a win for you with a score of 8 (2 because you chose Paper + 6 because you won).
# In the second round, your opponent will choose Paper (B), and you should choose Rock (X). This ends in a loss for you with a score of 1 (1 + 0).
# The third round is a draw with both players choosing Scissors, giving you a score of 3 + 3 = 6.
# 0loss 3draw 6win