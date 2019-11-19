def solution
  sum_of_squares = (1..100).to_a.map { |num| num**2 }.sum
  square_of_sum = (1..100).to_a.sum**2

  square_of_sum - sum_of_squares
end
