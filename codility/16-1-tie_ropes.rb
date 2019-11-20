# Complexity: O(n)
def solution(k, array)
  total_ropes = 0
  current = 0

  array.each do |rope_len|
    current += rope_len

    if current >= k
      total_ropes += 1
      current = 0
    end
  end

  total_ropes
end
