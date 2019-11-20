# Complexity: O(n)
require 'set'

def solution(x, a)
  result = Set.new

  a.each_with_index do |num, index|
    next if num > x

    result << num

    return index if result.size == x
  end

  -1
end
