require "set"

def compare_rugsack_compartments(elf1_items, elf2_items, elf3_items)
  elf1_items_set = elf1_items.split("").to_set
  elf2_items_set = elf2_items.split("").to_set
  elf3_items_set = elf3_items.split("").to_set

  common_item = elf1_items_set & elf2_items_set & elf3_items_set
  return common_item.to_a[0]
end

def find_item_priority(item)
  if "abcdefghijklmnopqrstuvwxyz".include?(item)
    return item.bytes[0] - 96
  else
    return item.downcase.bytes[0] - 96 + 26
  end
end

def import_items
  elf_group = []
  elf_count = 1
  priority_sum = 0
  count_elves = 0

  File.foreach("./puzzle-inputs/day_3.txt") { |line|
    count_elves += 1
    # puts "elf count is #{elf_count}"
    if line[-1] == "\n"
      elf_group << line[0..line.length - 2]
    else
      elf_group << line[0..line.length - 1]
    end

    if elf_count == 3
      # puts "elf group is #{elf_group} and its length is #{elf_group.length}"
      if elf_group.length != 3
        break
      end

      common_item = compare_rugsack_compartments(elf_group[0], elf_group[1], elf_group[2])
      priority_sum += find_item_priority(common_item)

      elf_count = 0
      elf_group = []
    end

    elf_count += 1
  }

  puts count_elves
  puts priority_sum
end

import_items
