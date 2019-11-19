def solution(total = 0, fib = [0, 1], max: 4_000_000)
  current = fib[-1] + fib[-2]

  return total if current > max

  total += current if current.even?
  fib << current

  solution(total, fib, max: max)
end
