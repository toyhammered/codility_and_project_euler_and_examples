MAPPINGS = {
  '{' => '}',
  '(' => ')',
  '[' => ']'
}.freeze

def solution(s)
  return 1 if s.empty?

  stack = []

  s.each_char do |char|
    if MAPPINGS.key?(char)
      stack << MAPPINGS[char]
    else
      last_char = stack.pop
      return 0 unless last_char == char
    end
  end

  stack.empty? ? 1 : 0
end
