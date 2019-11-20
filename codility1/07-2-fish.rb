def solution(a, b)
  return a.size if a.size < 2

  stack = []
  safe_fish = 0

  (a.size - 1).downto(0) do |i|
    if b[i].zero?
      stack << a[i]
    else
      loop do
        if stack.empty?
          safe_fish += 1
          break
        end

        break if stack.last > a[i]

        stack.pop
      end
    end
  end

  safe_fish += stack.size
end
