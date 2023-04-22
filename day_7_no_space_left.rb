def call(puzzle_input)
  total_size = 0
  puzzle_input.each do |command|
    p command.split(" ")[0].to_i if command[0].to_i != 0 && command.split(" ")[0].to_i <= 100000
    total_size += command.split(" ")[0].to_i if command[0].to_i != 0 && command.split(" ")[0].to_i <= 100000
  end

  total_size
end

puzzle_input = File.readlines("./puzzle-inputs/day_7.txt").map(&:chomp)
p call(puzzle_input)
