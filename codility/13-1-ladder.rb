def solution(a, b)
  results = []
  ways = [1, 1]

  (2..a.max).each do |n|
    ways[n] = ways[n - 1] + ways[n - 2]
  end

  a.size.times do |i|
    results << (ways[a[i]] & (2**b[i] - 1))
  end

  results
end
