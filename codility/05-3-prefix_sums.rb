def solution(a)
  # sliding window sizes
  left_side = 0
  right_side = a.size - 1

  # this will be returned
  starting_position = 0
  minimum_average = 2**32 - 1
  previous_sum = a[left_side..right_side].inject(:+)

  until (left_side - right_side).abs.zero?

    pieces = (left_side - right_side).abs + 1
    average = (previous_sum / pieces.to_f).round(2)

    if average < minimum_average
      starting_position = left_side
      minimum_average = average
    end

    # TODO:
    # The issue is when they are the same number by default
    # I move the right side down, but we really need to check
    # the next iteration and see which one is bigger and move that side
    # down. 

    if a[left_side] > a[right_side]
      previous_sum = previous_sum - a[left_side]
      left_side += 1
    else
      previous_sum = previous_sum - a[right_side]
      right_side -= 1
    end
  end

  starting_position
end
