def solution
  999.downto(900) do |x|
    999.downto(900) do |y|
      product = x * y
      return product if palindrome?(product)
    end
  end
end

def palindrome?(number)
  number.to_s == number.to_s.reverse
end
