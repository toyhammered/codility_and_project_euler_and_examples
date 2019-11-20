def solution(a)
  total = 0
  cars = 0
  total_size = a.size - 1

  total_size.downto(0) do |num|
    if a[num].zero?
      total += cars
    else
      cars += 1
    end
  end

  total > 1_000_000_000 ? -1 : total
end
