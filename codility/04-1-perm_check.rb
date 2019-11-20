require 'set'

def solution(a)
  result = Set.new
  len = a.size

  a.each do |num|
    return 0 if num > len

    result << num
  end

  result.size == len ? 1 : 0
end
