def calculate_score(shape, desired_result)
  shape_point_dict = { "A" => 1, "B" => 2, "C" => 3 }
  puts shape, desired_result, shape_point_dict[shape]
  if desired_result == "Z"
    return shape_point_dict[shape] + 6
  elsif desired_result == "Y"
    return shape_point_dict[shape] + 3
  else
    return shape_point_dict[shape]
  end
end

def result(opponent_shape, result_needed)
  # Rock is A, X is lose
  # Paper is B, Y is draw
  # Scissors is C, Z is win

  if opponent_shape == "A"
    if result_needed == "X"
      return "C"
    elsif result_needed == "Y"
      return "A"
    else
      return "B"
    end
  elsif opponent_shape == "B"
    if result_needed == "X"
      return "A"
    elsif result_needed == "Y"
      return "B"
    else
      return "C"
    end
  else
    if result_needed == "X"
      return "B"
    elsif result_needed == "Y"
      return "C"
    else
      return "A"
    end
  end
end

def import_strategy_guide
  your_score = 0

  File.foreach("./puzzle-inputs/day_2.txt") { |line|
    result = result(line[0], line[2])
    puts line[2].class
    your_score += calculate_score(result, line[2])
  }

  puts your_score
end

import_strategy_guide()
