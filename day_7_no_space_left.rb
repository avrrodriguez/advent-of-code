def read_command(puzzle_input, line_number)
  split_line = puzzle_input[line_number].split(" ")
  if split_line.include?("ls") || !split_line.include?("$")
    return [split_line[0], split_line[1]]
  else
    return [split_line[0], split_line[1], split_line[2]]
  end
end

def add_files_to_level_in_dictionary(files, dictionary)
end

def main(puzzle_input)
  line_number = 0
  current_command = read_command(puzzle_input, line_number)
  if current_command.include?("ls")
    line_number += 1
    current_command = read_command(puzzle_input, line_number)
    p current_command
    while current_command.include("$")
      current_command = read_command(puzzle_input, line_number)
      p current_command

      line_number += 1
    end
  end
end

puzzle_input = File.readlines("./puzzle-inputs/day_7.txt").map(&:chomp)
main(puzzle_input)
