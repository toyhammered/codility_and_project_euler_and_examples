def solution(result = [1, 1], index = 2)
  return index if result.last.to_s.size == 1000

  next_number = result.sum
  index += 1

  solution([result.last, next_number], index)
end

p solution
