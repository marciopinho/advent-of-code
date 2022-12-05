# items of one type go into one of the compartments

# two compartments of each rucksack has the same number of items.

# first half os string, first compartment. 2nd half, 2nd compartment.

# Lowercase item types a through z have priorities 1 through 26.
# Uppercase item types A through Z have priorities 27 through 52.

sum = 0
File.readlines("input.txt", chomp: true).each do |sack|
  # p sack

  # find out the length of items' list (should return even) to split it in half

  first, second = sack.chars.each_slice(sack.length / 2).map(&:join)

  # use char codes to determine out items priorities (subtracting as needed)

  (first.chars() & second.chars()).each do |doubled|
    if doubled.upcase == doubled
      sum += (doubled.ord - 38)
    else
      sum += (doubled.ord - 96)
    end
  end
  
end

puts sum