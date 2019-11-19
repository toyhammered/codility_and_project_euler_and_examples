require 'prime'

def solution(number = 2_000_000)
  sum_of_primes = 0

  number.downto(0).each do |num|
    sum_of_primes += num if Prime.prime?(num)
  end

  sum_of_primes
end

puts solution
