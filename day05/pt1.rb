input = File.readlines('./input.txt')
stacks = [[], [], [], [], [], [], [], [], []]
crates_indexes = [1, 5, 9, 13, 17, 21, 25, 29, 33]

input.first(8).each do |layer|
  crates_indexes.each_with_index do |num, i|
    stacks[i].push(layer[num]) unless layer[num].strip.empty?
  end
end

input[10..-1].each do |move|
  qty, from, to = move.scan(/\d+/).map(&:to_i)

  moved_crates = stacks[from - 1].shift(qty)
  stacks[to - 1] = moved_crates.reverse + stacks[to - 1]
end

stacks.each do |top_crate|
  print top_crate.first
end