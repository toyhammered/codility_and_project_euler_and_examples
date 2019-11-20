def solution(a)
  left = a.shift
  right = a.inject(:+)

  closest = (left - right).abs

  until a.size == 1
    elem = a.shift
    left += elem
    right -= elem

    closest = [closest, (left - right).abs].min
  end

  closest
end
