def find_elf_with_most_calories(elf_calories_dict)
  elf_highest_calories = 0
  elf_calories_dict.each do |_elf, elf_calories|
    elf_calories_sum = elf_calories.map { |calorie| calorie.to_i }.sum

    if elf_calories_sum > elf_highest_calories
      elf_highest_calories = elf_calories_sum
    end
  end

  p elf_highest_calories
end

def import_elf_calories
  elf_calories_dict = {}
  curr_elf_calories_arr = []
  curr_elf = 1
  File.foreach("./puzzle-inputs/day_1.txt") { |line|
    # puts line
    if line == "\n"
      line = " "
    else
      line = line[0..-2]
    end

    if line != " "
      curr_elf_calories_arr << line
    else
      elf_calories_dict["elf_#{curr_elf}"] = curr_elf_calories_arr
      curr_elf += 1
      curr_elf_calories_arr = []
    end
  }

  return elf_calories_dict
end

elf_calories_dict = import_elf_calories
find_elf_with_most_calories(elf_calories_dict)
