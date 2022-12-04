
data = File.read("./data.txt")

# first part of challenge
top_elf = data.split("\n\n").map { |elf| elf.split("\n").map(&:to_i).sum }.sort!.reverse!.first

# second part
top_elves_ttl = data.split("\n\n").map { |elf| elf.split("\n").map(&:to_i).sum }.sort!.reverse!.first(3).sum



puts top_elves_ttl
puts top_elf
