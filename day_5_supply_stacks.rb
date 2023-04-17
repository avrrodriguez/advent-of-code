def add_to_crate_stacks(crate_line)
  # p crate_line.class
  crate_line.split("").each_with_index do |line, index|
    if !line.eql?(" ") && !line.eql?("[") && !line.eql?("]")
      p "#{line}, #{line.eql?("[")}"
      if !@crate_stacks_dict.include?(index + 1)
        @crate_stacks_dict[index + 1] = [line]
      else
        @crate_stacks_dict[index + 1].insert(0, line)
      end
    end
  end
end

def main(puzzle_input)
  @crate_stacks_dict = {}

  puzzle_input.each do |line|
    # p line.split("")
    break if !line.split("").include?("[")
    add_to_crate_stacks(line)
  end

  p @crate_stacks_dict
end

puzzle_input = File.readlines("./puzzle-inputs/day_5.txt").map(&:chomp)
main(puzzle_input)
