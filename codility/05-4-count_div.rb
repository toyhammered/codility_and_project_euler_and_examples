# O(n) - 50% pass
# This will timeout
def solution(a, b, k)
  input = (a..b).to_a
  result = input.select { |num| (num % k).zero? }.size
  result
end

# O(1) - 100% pass
# pure math, no coding.
def solution1(a, b, k)
  if (a % k).zero?
    (b - a) / k + 1
  else
    (b - (a - a % k)) / k
  end
end
