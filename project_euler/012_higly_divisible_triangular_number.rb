def solution(divisors = 500)
  last_num = 0

  (1..5_000_000).to_a.each do |i|
    print "#{i},"
    current_amount = 0
    last_num += i

    squared_num = Math.sqrt(last_num).floor
    # when we square the number we can calculate half of the numbers
    # so for Math.sqrt(36) it would return 6 and then we iterate
    # from (1..6) and check if there is a divisor (and then add 2)
    next if squared_num < divisors / 2

    (1..squared_num).each do |num|
      next unless (last_num % num).zero?

      # we do not want to add duplicates like 6 * 6
      current_amount += [last_num / num, num].uniq.size
    end

    return last_num if current_amount >= divisors

    # reset
    current_amount = 0
  end

  last_num
end

puts solution
