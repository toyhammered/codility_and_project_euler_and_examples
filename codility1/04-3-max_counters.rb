def solution(n, a)
  result = [0] * n
  total_size = result.size
  max_counter = 0

  a.each do |num|
    if num > total_size
      # we set all the results to the max counter
      result = [max_counter] * n
    else
      pos = num - 1
      result[pos] += 1

      # find the new max_counter
      max_counter = [max_counter, result[pos]].max
    end
  end

  result
end
