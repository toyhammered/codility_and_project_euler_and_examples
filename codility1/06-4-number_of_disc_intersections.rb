def solution(a)
  lower_bound, upper_bound = [], []
  low_index = 0
  intersections = 0

  a.each_with_index do |radius, center|
    upper_bound << center + radius
    lower_bound << center - radius
  end

  lower_bound.sort!
  upper_bound.sort!

  upper_bound.each_with_index do |up, up_index|
    while (low_index < a.size) && up >= lower_bound[low_index]
      low_index += 1
    end

    intersections += (low_index - up_index - 1)
  end

  intersections > 10_000_000 ? -1 : intersections
end
