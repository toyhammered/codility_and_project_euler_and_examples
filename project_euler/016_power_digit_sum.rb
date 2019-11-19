def solution
  result = 2**1000

  result.to_s.split('').map(&:to_i).sum
end

p solution
