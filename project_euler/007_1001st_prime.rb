require 'prime'

def solution(number)
  inc = 2

  until number.zero?
    number -= 1 if Prime.prime?(inc)

    inc += 1
  end

  # we need to subtract 1 because until loop checks 1 after.
  inc - 1
end

# need to find this number of prime
number = 10_001
puts solution(number)
