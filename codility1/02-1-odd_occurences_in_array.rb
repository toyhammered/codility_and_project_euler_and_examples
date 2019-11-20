def solution(a)
  results = Hash.new(0)

  a.each do |num|
    results[num] += 1
  end

  value = results.values.find(&:odd?)
  results.key(value)
end
