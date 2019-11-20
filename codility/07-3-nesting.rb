def solution(s)
  stack = []

  s.each_char do |char|
    if char == '('
      stack << char
    elsif stack.empty?
      return 0
    else
      stack.pop
    end
  end

  stack.empty? ? 1 : 0
end
