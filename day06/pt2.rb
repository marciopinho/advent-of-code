input = File.read('./input.txt')

arr = []

input.each_char.each_with_index do |el, i|
  arr << el

  arr.each_cons(14) { |seq| p i if seq.uniq.length > 13 }
end