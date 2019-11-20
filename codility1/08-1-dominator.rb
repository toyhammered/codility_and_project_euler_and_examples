def solution(a)
  arr_len = a.size
  size = 0
  candidate = nil

  a.each do |num|
    if size.zero?
      size += 1
      candidate = num
    else
      if candidate != num
        size -= 1
      else
        size += 1
      end
    end
  end

  # no candidate found
  return -1 if size.zero?

  count = 0
  final_index = nil

  a.each_with_index do |num, index|
    if candidate == num
      count += 1
      final_index ||= index
    end
  end

  count > arr_len / 2 ? final_index : -1
end
