def solution(n)
  binary_number = int_to_binary_string(n)

  start = false
  current = 0
  max = 0

  binary_number.each_char do |char|
    next if start == false && char == '0'

    if char == '1' && start
      max = [max, current].max
      current = 0
    elsif char == '0'
      current += 1
    else
      start = true
    end
  end

  max
end

# will convert to a string in binary form
# we could always monkeypatch Integer class
def int_to_binary_string(number)
  number.to_s(2)
end
