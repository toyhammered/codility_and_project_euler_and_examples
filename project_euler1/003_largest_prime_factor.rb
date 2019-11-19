require 'prime'

def solution(number)
  Prime.prime_division(number).last.first
end
