def solution
  results = [triangle.shift]

  triangle.each do |row|
    row_size = row.size
    result = Array.new(row_size, 0)

    current_index = 0
    previous_row = results.last

    while current_index < row_size
      num =
        if current_index.zero?
          # first number
          row[current_index] + previous_row[current_index]
        elsif current_index == row_size - 1
          # last number
          row[current_index] + previous_row[current_index - 1]
        else
          # we check the number to the left and the current one
          # so for [2, 4, 6] when it is 4 (index 1)
          # it will check index 0 and 1 of previous row [7, 4]
          # (this is of original, we actually modify to have the highest total)
          current_num = row[current_index]

          [
            current_num + previous_row[current_index - 1],
            current_num + previous_row[current_index]
          ].max
        end

      result[current_index] = [result[current_index], num].max
      current_index += 1
    end

    results << result
  end

  results.last.max
end

def triangle
  return @triangle if @triangle

  results = []

  file.each_line do |line|
    formatted_line = line.split(' ').map(&:to_i)
    results << formatted_line
  end

  @triangle = results
  @triangle
end

def file
  @file ||= File.read('lib/018_maximum_path_sum_1/triangle.txt')
end

# def file
#   @file ||= File.read('lib/018_maximum_path_sum_1/triangle_example.txt')
# end

p solution
