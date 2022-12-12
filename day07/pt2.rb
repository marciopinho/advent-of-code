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

sm_folder = root.traverse.map(&:dir_size).select { |size| size >= root.dir_size - 40_000_000 }.min

puts sm_folder