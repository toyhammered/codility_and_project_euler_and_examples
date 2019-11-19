def solution
  (1..998).each do |a|
    (2..999).each do |b|
      c = 1000 - a - b

      next unless a < b && b < c
      next unless a * a + b * b == c * c

      return a * b * c
    end
  end
end

puts solution
