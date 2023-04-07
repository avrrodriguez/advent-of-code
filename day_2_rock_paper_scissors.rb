def calculate_score(shape, result)
  shape_point_dict = { "X" => 1, "Y" => 2, "Z" => 3 }
  puts shape, shape_point_dict[shape]
  if result == "1"
    return shape_point_dict[shape] + 6
  elsif result == "1/2"
    return shape_point_dict[shape] + 3
  else
    return shape_point_dict[shape]
  end
end

def result(opponent_shape, your_shape)
  # Rock is A, X
  # Paper is B, Y
  # Scissors is C, Z

  if opponent_shape == "A"
    if your_shape == "X"
      return "1/2"
    elsif your_shape == "Y"
      return "1"
    else
      return "0"
    end
  elsif opponent_shape == "B"
    if your_shape == "X"
      return "0"
    elsif your_shape == "Y"
      return "1/2"
    else
      return "1"
    end
  else
    if your_shape == "X"
      return "1"
    elsif your_shape == "Y"
      return "0"
    else
      return "1/2"
    end
  end
end

def import_strategy_guide
  your_score = 0

  File.foreach("./puzzle-inputs/day_2.txt") { |line|
    result = result(line[0], line[2])
    puts line[2].class
    your_score += calculate_score(line[2], result)
  }

  puts your_score
end

import_strategy_guide()
