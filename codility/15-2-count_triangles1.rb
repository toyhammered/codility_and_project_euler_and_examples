def solution(array)
  total_triangles = 0
  array = array.sort
  array_size = array.size

  array_size.times do |x|
    z = x + 2
    (x + 1..array_size - 1).each do |y|
      while (z < array_size && array[x] + array[y] > array[z])
        z += 1
      end

      total_triangles += z - y - 1
    end
  end

  total_triangles
end
