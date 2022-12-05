games = File.readlines("./input.txt", chomp: true).map do |game|
  game.split(' ')
end

score = 0

games.each do |game|
  elf = game[0]
  second_col = game[1]

  rock = 1
  paper = 2
  scissors = 3

  if second_col == 'X' # I need to lose
    case elf
    when 'A'
      score += scissors
    when 'B'
      score += rock
    when 'C'
      score += paper
    end

  elsif second_col == 'Y' # I need a draw
    case elf
    when 'A'
      score += (3 + rock)
    when 'B'
      score += (3 + paper)
    when 'C'
      score += (3 + scissors)
    end

  elsif second_col == 'Z' # I need to win
    case elf
    when 'A'
      score += (6 + paper)
    when 'B'
      score += (6 + scissors)
    when 'C'
      score += (6 + rock)
    end
  end

end

puts score