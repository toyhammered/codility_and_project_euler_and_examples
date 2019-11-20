def solution(a)
  return 0 if a.size < 3
  a.sort!

  (0..a.length - 3).each do |i|
    return 1 if a[i] + a[i + 1] > a[i + 2]
  end

  0
end
