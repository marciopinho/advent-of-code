sum_of_badges = 0

File.readlines("input.txt", chomp: true).each_slice(3) do |group|
  
  badges = group[0].chars & group[1].chars & group[2].chars

  badges.each do |badge|

    if badge.upcase == badge
      sum_of_badges += (badge.ord - 38)
    else
      sum_of_badges += (badge.ord - 96)
    end
  end
  
end

puts sum_of_badges