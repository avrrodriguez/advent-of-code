require "pry"

def add_to_crate_stacks(crate_line)
  crate_line.split("").each_with_index do |line, index|
    next if [" ", "[", "]"].include?(line)

    crate_place = ((index - 1) / 4) + 1

    @crate_stacks_dict[crate_place].unshift(line)
  end
end

def move_crate_to_another_stack(move_amount, from, to)
  # for move in 0..move_amount - 1
  @crate_stacks_dict[to] << @crate_stacks_dict[from].pop(move_amount)
  # end

  @crate_stacks_dict[to].flatten!
end

def main(puzzle_input)
  @crate_stacks_dict = Hash.new { |h, k| h[k] = [] }

  crate_stack_ids = []

  puzzle_input.each do |line|
    break if !line.split("").include?("[")
    add_to_crate_stacks(line)
  end

  puzzle_input.each do |line|
    next if !line.split(" ").include?("move")

    crate_stack_ids = line.split(" ").select { |elem| elem.to_i != 0 }.map { |num| num.to_i }

    move_crate_to_another_stack(crate_stack_ids[0], crate_stack_ids[1], crate_stack_ids[2])
  end

  p @crate_stacks_dict
end

puzzle_input = File.readlines("./puzzle-inputs/day_5.txt").map(&:chomp)
main(puzzle_input)
