def solution
  grid = generate_grid_from_file
  grid_width = grid.first.size
  grid_height = grid.size

  largest = 0
  # grid[height][width]
  (0..grid_height - 4).each do |h|
    (0..grid_width - 4).each do |w|
      largest = [
        right(grid, h, w),
        down(grid, h, w),
        down_right(grid, h, w),
        largest
      ].max
    end
  end

  (0..grid_height - 4).each do |h|
    (grid_width - 1).downto(3) do |w|
      largest = [
        down_left(grid, h, w),
        down(grid, h, w),
        largest
      ].max
    end
  end

  largest
end

def right(grid, h, w)
  grid[h][w..w + 3].inject(:*)
end

def down(grid, h, w)
  total = 1

  4.times do |i|
    total *= grid[h + i][w]
  end

  total
end

def down_right(grid, h, w)
  total = 1

  4.times do |i|
    total *= grid[h + i][w + i]
  end

  total
end

def down_left(grid, h, w)
  total = 1

  4.times do |i|
    total *= grid[h + i][w - i]
  end

  total
end

def generate_grid_from_file
  grid = []

  file.each_line do |line|
    grid << line.split(' ').map(&:to_i)
  end

  grid
end

def file
  @file ||= File.read('lib/011_largest_product_in_a_grid/number.txt')
end

puts solution
