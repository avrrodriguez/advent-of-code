def read_command(puzzle_input, line_number)
  split_line = puzzle_input[line_number].split(" ")
  if split_line.include?("ls") || !split_line.include?("$")
    return [split_line[0], split_line[1]]
  else
    return [split_line[0], split_line[1], split_line[2]]
  end
end

def add_files_to_level_in_dictionary(puzzle_input, file_structure, line_number)
  line_number += 1
  current_command = read_command(puzzle_input, line_number)
  # p [file_structure, line_number, current_command]
  while !current_command.include?("$")
    file_structure[current_command[1]] = {} if current_command.include?("dir")
    file_structure[current_command[0]] = current_command[1] if !current_command.include?("dir")

    line_number += 1
    break if line_number >= puzzle_input.length
    current_command = read_command(puzzle_input, line_number)
  end

  return [line_number, file_structure]
end

def look_in_hash_level(puzzle_input, file_structure, current_file_path, line_number)
  while puzzle_input[line_number]
    # p puzzle_input[line_number]
    current_command = read_command(puzzle_input, line_number)
    break if current_command[2] == ".."
    p [current_command, file_structure, current_file_path]

    if current_command.include?("cd")
      look_in_hash_level(puzzle_input, file_structure[file_structure[current_command[2].to_s]], current_command[2], line_number + 1)
      line_number = look_in_hash_level[0]
      file_structure = look_in_hash_level[1]
      break
    end

    if current_command.include?("ls")
      added_files = add_files_to_level_in_dictionary(puzzle_input, file_structure, line_number + 1)
      line_number = added_files[0]
      file_structure[current_file_path.to_s] = added_files[1]
    end
    line_number += 1
  end

  return [line_number, file_structure]
end

def main(puzzle_input)
  file_structure = Hash.new { |h, k| h[k] = {} }
  file_structure["/"] = {}
  current_file_path = "/"
  line_number = 0

  final_dict = look_in_hash_level(puzzle_input, file_structure, current_file_path, line_number)

  p ["final dict", final_dict]
end

puzzle_input = File.readlines("./puzzle-inputs/day_7.txt").map(&:chomp)
main(puzzle_input)
