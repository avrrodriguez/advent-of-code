# def section2_range_inside_section1_range?(sections1, sections2)
#   (sections2[0].to_i >= sections1[0].to_i) && (sections2[-1].to_i <= sections1[-1].to_i)
# end

def sections_overlapping?(sections1, sections2)
  (sections1[0].to_i >= sections2[0].to_i) && (sections1[-1].to_i <= sections2[-1].to_i)
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
    overlapping_assignments += 1 if sections_overlapping?(section_ranges[0], section_ranges[1]) ||
                                    sections_overlapping?(section_ranges[1], section_ranges[0])
  }

  p overlapping_assignments
end

# file.open readlines chomp true
import_section_assignments
