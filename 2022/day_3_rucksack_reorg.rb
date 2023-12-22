require "set"

def compare_rugsack_compartments(items_rugsack1, items_rugsack2)
  items_rugsack1_set = items_rugsack1.split("").to_set
  items_rugsack2_set = items_rugsack2.split("").to_set

  common_item = items_rugsack1_set & items_rugsack2_set
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
  items_rugsack1 = ""
  items_rugsack2 = ""
  priority_sum = 0

  File.foreach("./puzzle-inputs/day_3.txt") { |line|
    if line[-1] == "\n"
      items_rugsack1 = line[0..line.length / 2 - 1]
      items_rugsack2 = line[line.length / 2..line.length - 2]
    else
      items_rugsack1 = line[0..line.length / 2 - 1]
      items_rugsack2 = line[line.length / 2..line.length - 1]
    end

    common_item = compare_rugsack_compartments(items_rugsack1, items_rugsack2)
    # p [common_item, find_item_priority(common_item)]
    priority_sum += find_item_priority(common_item)
  }

  puts priority_sum
end

import_items
