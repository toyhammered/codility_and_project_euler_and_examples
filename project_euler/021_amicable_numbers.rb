def solution
  total = 0

  (1...10_000).each do |number|
    a = calc_factors(number)
    b = calc_factors(a)

    # a and b after calculating factors sum cannot be the same
    next if a == b
    # the original number and b have to be the same
    next unless b == number

    total += number
  end

  total
end

def calc_factors(number)
  return 1 if number < 2

  squared_num = Math.sqrt(number).floor
  total = 1

  (2..squared_num).each do |num|
    next unless (number % num).zero?

    total += [number / num, num].uniq.sum
  end

  total
end

p solution
