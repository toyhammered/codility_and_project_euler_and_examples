def solution(a)
  results = Array.new(a.size)

  a.size.times do |i|
    next if a[i] <= 0

    results[a[i] - 1] = 1
  end

  results.size.times do |num|
    return num + 1 if results[num].nil?
  end

  results.size + 1
end
