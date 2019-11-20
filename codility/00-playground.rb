require 'byebug'
# @param {String} s
# @return {Boolean}
def valid_palindrome(s)
  left = 0
  right = s.size - 1

  while left < right
    if s[left] != s[right]
      s1 = s[left..right - 1]
      s2 = s[left + 1..right]
      return s1 == s1.reverse || s2 == s2.reverse
    end

    left += 1
    right -= 1
  end
end

p valid_palindrome('abca')
