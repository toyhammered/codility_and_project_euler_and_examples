# Complexity: O^3
def solution(array)
  total_triangles = 0
  array = array.sort
  array_size = array.size

  array_size.times do |x|
    (x + 1..array_size - 1).each do |y|
      z = y + 1
      while (z < array_size)
        if array[x] + array[y] > array[z]
          total_triangles += 1
          z += 1
        else
          break
        end
      end
    end
  end

  total_triangles
end
