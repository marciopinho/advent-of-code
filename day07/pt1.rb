require './directory.rb'

root = Directory.new('/')
current_dir = root

File.open('input.txt', 'r') do |file|
  file.readline

  loop do
    break if file.eof?
    line = file.readline.chomp

    if line.start_with?('$')
      _, cmd, arg = line.split(' ')
      if cmd == 'cd'
        if arg == '..'
          current_dir = current_dir.parent
        else
          current_dir = current_dir.children[arg]
        end
      end
    else
      current_dir.parse_response(line)
    end
  end
end

tallied = root.traverse.reduce(0) do |sum, dir|
  size = dir.dir_size
  sum += size if size <= 100000
  sum
end

puts tallied