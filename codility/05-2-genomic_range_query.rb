MAPPINGS = {
  'A' => 1,
  'C' => 2,
  'G' => 3,
  'T' => 4
}.freeze

def solution(s, p, q)
  results = []
  total_size = [p.size, q.size].max

  total_size.times do |i|
    p_val = p[i]
    q_val = q[i]

    left_val, right_val = p_val < q_val ? [p_val, q_val] : [q_val, p_val]

    letter_values = []
    range = s[left_val..right_val]

    range.each_char do |char|
      letter_values << MAPPINGS[char]
    end
    
    results << letter_values.min
  end

  results
end
