def solution(n)
  return n if n < 3

  upper_bound = Math.sqrt(n).floor
  results = 0

  (1..upper_bound).each do |num|
    next unless (n % num).zero?

    results += 2
    results -= 1 if num * num == n
  end

  results
end
