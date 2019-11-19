# def solution(down = 20, right = 20)
#   return 1 if down.zero? && right.zero?
#
#   total = 0
#
#   total += solution(down - 1, right) if down.positive?
#   total += solution(down, right - 1) if right.positive?
#
#   total
# end
#
# puts solution

# creating pascals triangle and then just grabbing the center number
# will determine how many paths there are
# http://mathforum.org/advanced/robertd/manhattan.html

def solution(num)
  total_rows = num * 2
  results = pascal_calc(total_rows)

  # get center number
  results[results.size / 2]
end

def pascal_calc(num)
  return [1] if num.zero?

  previous = pascal_calc(num - 1)

  ret = []

  (previous.length - 1).times do |i|
    ret << (previous[i] + previous[i + 1])
  end

  [1, ret, 1].flatten
end

puts solution(20)
