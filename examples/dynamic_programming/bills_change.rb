require 'rspec/autorun'
# You are a cashier working at a register that only contains an unlimited amount of $2, $5 and $10 bills.
# Create a function that, given a cash amount, returns the correct change with minimum amount of bills.
# If it is impossible to give the correct change, return null, otherwise return an object with the count of each bill.
# examples:
# $42 should return {ten: 4, five: 0, two: 1}
# $11 should return {ten: 0, five: 1: two 3}
# $3 should return null

# Notes:
# The idea is to use dynamic programming to keep track of how many notes (and what notes)
# previous targets use and to just keep iterating ontop of that.
# This is very similar to the coin change problem, the only difference is that nil is possible
# because the lowest bill is 2 (instead of 1).
# The other caveat is that we must keep track of all the notes used to get to that target.

def dynamic_bills_change(bills, target)
  # All negative numbers are impossible
  return nil if target.negative?
  # The only numbers that isn't possible to have change for
  # are 1 and 3, because 2 is the lowest even number and 5 is lowest odd number
  # 5 + 2 will always be odd, so we can calculcate any odd number.
  return nil if [1, 3].include?(target)

  # initialize fixed size array + 1 to account for 0 index
  results = Array.new(target + 1, nil)
  results_size = results.size

  # iterate through each bill
  bills.each do |bill|

    # the index of the array is the amount we are going to store the least amount of
    # bills needed to get to that specific spot
    # this will be a hash to include the bills, and their count
    results_size.times do |i|
      next if i < bill

      if bill == i
        # This is the base structure of the has
        # if the current bill is equal to the current index we know it will
        # be a count of 1 (and 1 of that bill)
        results[i] = default_amount(bill)
        next
      end

      # can't be a reference to previous amount
      # we are getting the previous amount based on the current iteration
      # and what the bill is.
      # so if i = 9 and bill = 5
      # we jump to index 4, grab that data, and then add the current bill to it
      # this is the new current_amount
      current_amount = results[i - bill].dup

      # if the previous is nil, we can just skip
      # because that means it isn't possible
      next if current_amount.nil?

      # we increment the bill and the count by 1 because from previous point
      # to current point it will take 1 more bill
      current_amount[bill] += 1
      current_amount[:count] += 1

      # check if a current result exists, and if the new count is less than what
      # currently exists at that index
      if results[i].nil? || current_amount[:count] < results[i][:count]
        results[i] = current_amount
      end
    end
  end

  # we just care about the last result

  formatted_result(results.last)
end

# This will be used to overwrite the nil with a hash amount with 1 of the bill and 1 to count
def default_amount(bill)
  amount = {
    2 => 0,
    5 => 0,
    10 => 0,
    count: 0
  }

  amount[bill] += 1
  amount[:count] += 1
  amount
end

def formatted_result(result)
  {
    two: result[2],
    five: result[5],
    ten: result[10]
  }
end

RSpec.describe '#dynamic_bills_change' do
  let(:bills) { [2, 5, 10] }

  describe 'valid' do
    example '11' do
      result = { ten: 0, five: 1, two: 3 }
      expect(dynamic_bills_change(bills, 11)).to eq(result)
    end

    example '42' do
      result = { ten: 4, five: 0, two: 1 }
      expect(dynamic_bills_change(bills, 42)).to eq(result)
    end
  end

  describe 'invalid' do
    example '1' do
      expect(dynamic_bills_change(bills, 1)).to be_nil
    end

    example '-1' do
      expect(dynamic_bills_change(bills, -1)).to be_nil
    end

    example '3' do
      expect(dynamic_bills_change(bills, 3)).to be_nil
    end
  end
end
