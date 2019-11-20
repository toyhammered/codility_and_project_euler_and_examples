def solution(a)
  lowest_number = a.shift
  max_profit = 0

  a.each do |num|
    max_profit = [max_profit, (num - lowest_number)].max
    lowest_number = [lowest_number, num].min
  end

  max_profit
end
