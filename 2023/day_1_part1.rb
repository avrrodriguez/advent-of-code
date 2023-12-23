# What is the sum of all of the calibration values?
# the first digit and the last digit
# consider numbers that are spelled out ie one or two
# two different functions one that detects digits in the text and another that detects numbers that are spelled ie one∏

def is_integer(text_string)
  if text_string == "0"
    return true
  elsif text_string.to_i > 0
    return true
  end

  return false
end

def contains_spelled_integer(text_string)
  if text_string.include? "eightwo"
    text_string = text_string.sub("eight", "8")
  end

  while text_string.include? "one"
    text_string = text_string.sub("one", "1")
  end
  while text_string.include? "two"
    text_string = text_string.sub("two", "2")
  end
  while text_string.include? "three"
    text_string = text_string.sub("three", "3")
  end
  while text_string.include? "four"
    text_string = text_string.sub("four", "4")
  end
  while text_string.include? "five"
    text_string = text_string.sub("five", "5")
  end
  while text_string.include? "six"
    text_string = text_string.sub("six", "6")
  end
  while text_string.include? "seven"
    text_string = text_string.sub("seven", "7")
  end
  while text_string.include? "eight"
    text_string = text_string.sub("eight", "8")
  end
  while text_string.include? "nine"
    text_string = text_string.sub("nine", "9")
  end

  return text_string
end

def loop_puzzle_input(puzzle_input_list)
  p puzzle_input_list.length
  sum = 0
  for i in puzzle_input_list
    number = call(i).to_i
    p i, number

    sum += number
  end

  p sum
end

def call(puzzle_input)
  format_string = contains_spelled_integer(puzzle_input)
  split_string = format_string.split("")
  number_str = ""
  temp = ""
  for i in split_string
    if number_str.length == 0 && is_integer(i)
      number_str << i
    elsif number_str.length > 0 && is_integer(i)
      temp = i
    end
  end
  return number_str << temp
end

# 50648 too low
puzzle_input = File.readlines("/Users/abrahamrodriguez/Desktop/practice-folder/advent-of-code/puzzle-inputs/2023/day_1.txt").map(&:chomp)
loop_puzzle_input(puzzle_input)

p contains_spelled_integer("eightjlkckhqjfonesix94twoeightvggdqxgcn")
