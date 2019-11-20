def solution(a)
  results = (1..a.size + 1).to_a
  (results - a).first
end
