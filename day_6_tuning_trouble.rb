def call(puzzle_input)
  uniq_chars = []
  puzzle_input.split("").each_with_index do |letter, index|
    # p [letter, index, uniq_chars]
    uniq_chars = uniq_chars[uniq_chars.find_index(letter) + 1..-1] if uniq_chars.include?(letter)
    return index + 1 if uniq_chars.length == 3

    uniq_chars << letter
  end
end

puzzle_input = File.readlines("./puzzle-inputs/day_6.txt").map(&:chomp)[0]
# p puzzle_input
p call(puzzle_input)