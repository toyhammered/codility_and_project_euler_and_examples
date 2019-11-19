# Watch this video to understand the logic behind what I am doing (very similar to his)
# https://www.youtube.com/watch?v=jaNZ83Q3QGc
def dynamic_coin_changing(coins, target)
  results = [0] * (target + 1)
  results.size.times { |i| results[i] = i }

  coins.each do |coin|
    # This will set the initial array so that it is:
    # [0, 1, 2, 3, 4, 5, 6] for target = 6
    if coin == 1
      results.size.times { |i| results[i] = i }
      next
    end

    results.size.times do |result_index|
      # we don't need to check anything if the current index is less than coin
      next if result_index < coin

      # if the result_index is equal to coin, it will always only require itself
      # so we can set it to 1
      # if it doesn't equal itself, we can just check the last number minus the coin
      # so for result_index = 6 and coin = 3 we do
      # results[6 - 3] + 1 and check if that is less than what is currently stored there
      # when coin is 4 it will be results[6 - 4] + 1 (which is 3, because at index 2)
      # it requires 1 + 1 (which we stored in there) and [3, 2].min will just keep 2.
      results[result_index] =
        if result_index == coin
          1
        else
          [results[result_index], results[result_index - coin] + 1].min
        end
    end
  end

  results.last
end

coins = [1, 3, 4]
target = 14
p dynamic_coin_changing(coins, target)
# [0, 1, 2, 1, 1, 2, 2]
