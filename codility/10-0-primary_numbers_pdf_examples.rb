# will return an array of factors
def factors(number)
  results = []

  final_iterator = Math.sqrt(number).floor

  (1..final_iterator).each do |i|
    next unless (number % i).zero?

    results << [number / i, i]
  end

  results
end

print factors(36)
# [[36, 1], [18, 2], [12, 3], [9, 4], [6, 6]]
