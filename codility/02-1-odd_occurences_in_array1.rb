# Complexity: O(n)
# Space: O(1)
def solution(a)
  a.sort!

  index = 0
  while index < a.size
    if a[index] == a[index + 1]
      index += 2
    else
      return a[index]
    end
  end

  -1
end
