require 'byebug'
def generate(num, result = [])
  if num.zero?
    result << [1]
    return result
  end

  previous = generate(num - 1, result).last
  ret = []

  (previous.length - 1).times do |i|
    ret << (previous[i] + previous[i + 1])
  end
  result << [1, ret, 1].flatten
end

p generate(5)
