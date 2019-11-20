def solution(x, y, d)
  jumps = (y - x) / d

  jumps += 1 unless ((y - x) % d).zero?
  jumps
end
