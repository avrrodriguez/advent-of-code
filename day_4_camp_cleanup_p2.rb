def compare_sections(sections1, sections2)
  # p "sections 1 ranges #{sections1[0]} #{sections1[-1]}"
  # p "sections 2 ranges #{sections2[0]} #{sections2[-1]}"

  if (sections2[0].to_i >= sections1[0].to_i) & (sections2[-1].to_i <= sections1[-1].to_i)
    return true
  elsif (sections1[0].to_i >= sections2[0].to_i) & (sections1[1].to_i <= sections2[-1].to_i)
    return true
  else
    return false
  end
end

def import_section_assignments
  overlapping_assignments = 0
  section_ranges = 0
  File.foreach("./puzzle-inputs/day_4.txt") { |line|
    if line.include?("\n")
      section_ranges = line[0..-2].split(",").map() { |range| range.split("-") }
    else
      section_ranges = line.split(",").map() { |range| range.split("-") }
    end

    # p section_ranges[0]
    # p section_ranges[1]
    if compare_sections(section_ranges[0], section_ranges[1])
      overlapping_assignments += 1
    end
  }

  p overlapping_assignments
end

import_section_assignments
