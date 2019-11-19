# problem: https://projecteuler.net/problem=1

def solution(number)
  return 0 if number.negative?

  result = 0

  (1...number).to_a.each do |num|
    result += num if (num % 3).zero? || (num % 5).zero?
  end

  result
end
