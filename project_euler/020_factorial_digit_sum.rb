def solution
  total = (1..100).inject(&:*)
  total.to_s.split('').map(&:to_i).sum
end

p solution
