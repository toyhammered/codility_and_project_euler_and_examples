def solution(a)
  candidate = find_candidate(a)

  leader = find_leader(a, candidate)
  return 0 if candidate.nil? || leader.nil?



end

def find_candidate(a)
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
  return nil if size.zero?
end

def find_leader(a, candidate)
  return if candidate.nil?

  count = 0

  a.each_with_index do |num, index|
    count += 1 if candidate == num
  end

  count > a.size / 2 ? final_index : -1
end
