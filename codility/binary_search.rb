require 'rspec/autorun'
require 'byebug'
# READ: https://www.topcoder.com/community/competitive-programming/tutorials/binary-search/

# def binary_search_example1(array, target)
#   low = 0
#   high = array.size - 1
#
#   while low < high
#     mid = low + (high - low) / 2
#
#     # index is returned
#     return mid if array[mid] == target
#
#     # if the array number is less than target
#     # the low will move closer to the high
#     if array[mid] < target
#       low = mid + 1
#     else
#       high = mid - 1
#     end
#   end
#
#   -1
# end
#
# array = [0, 5, 13, 19, 22, 41, 55, 68, 72, 81, 98]
# target = 55
# puts binary_search_example1(array, target)

def boards(array, k)
  n = array.size
  start = 1
  finish = n
  result = -1

  while start <= finish
    mid = (start + finish) / 2
    byebug
    if check?(array, mid) <= k
      finish = mid - 1
      result = mid
    else
      start = mid + 1
    end
  end

  result
end

def check?(array, k)
  n = array.size
  boards = 0
  last = -1

  n.times do |i|
    if array[i] == 1 && last < i
      boards += 1
      last = i + k - 1
    end
  end

  boards
end

describe 'Board Size' do
  it "gives board size to cover all holes (1's) in array, given k boards" do
    # expect(boards([0, 1, 0, 1, 1, 1, 0, 1], 1)).to eq 7
    expect(boards([0, 1, 0, 1, 1, 1, 0, 1], 2)).to eq 4
    # expect(boards([0, 1, 0, 1, 1, 1, 0, 1], 3)).to eq 3
    # expect(boards([0, 1, 0, 1, 1, 1, 0, 1], 4)).to eq 2
    # expect(boards([0, 1, 0, 1, 1, 1, 0, 1], 5)).to eq 1
    # expect(boards([0, 1, 0, 1, 1, 1, 0, 1], 6)).to eq -1
  end
end
