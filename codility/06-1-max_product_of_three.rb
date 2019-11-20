def solution(a)
  a.sort!

 lowest, second_lowest = a[0], a[1]
 highest, second_highest, third_highest = a[-1], a[-2], a[-3]

 # this does not include the highest number
 # only the 2 lowest negatives and 2 highest positives
 highest_pair = [(lowest * second_lowest), (second_highest * third_highest)]

 # if all negative, we need to get min.
 highest_pair = highest < 0 ? highest_pair.min : highest_pair.max

 highest_pair * highest
end
