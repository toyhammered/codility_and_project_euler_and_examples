def solution
  numbers = []

  abundant_numbers.each_with_index do |abundant_number, index|
    while index < abundant_numbers.size
      sum = abundant_number + abundant_numbers[index]

      break if sum > 28_123

      numbers << sum
      index += 1
    end
  end

  (1..28_123).sum - numbers.uniq.sum
end

def abundant_numbers
  return @abundant_numbers if @abundant_numbers

  @abundant_numbers = []

  (1..28_123).each do |num|
    @abundant_numbers << num if factors(num).sum > num
  end

  @abundant_numbers
end

def factors(number)
  factors = [1]
  squared_num = Math.sqrt(number).floor

  (2..squared_num).each do |num|
    next unless (number % num).zero?

    current_factors = [number / num, num].uniq

    factors.concat(current_factors)
  end

  factors
end

p solution
