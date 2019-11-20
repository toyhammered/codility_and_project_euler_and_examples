def solution(a)
  max_ending = max_slice = a.shift

  a.each do |num|
    max_ending = [num, max_ending + num].max
    max_slice = [max_slice, max_ending].max
  end

  max_slice
end
