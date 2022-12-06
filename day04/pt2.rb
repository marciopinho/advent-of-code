sum = 0

# array with lines:
File.readlines('input.txt', chomp: true).each do |pair|
  
  # filter digits only, MAKing each line into an array of 4 items:
  nums = pair.scan(/\d+/).map(&:to_i)

  range_a = (nums[0]..nums[1])
  range_b = (nums[2]..nums[3])

  if nums[0] <= nums[3] && nums[1] >= nums[2]
    sum += 1
  end

end

puts sum