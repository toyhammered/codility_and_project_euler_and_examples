def solution
  longest_chain = 0
  number = 0

  999_999.downto(1).each do |i|
    current_num = i
    print "#{i},"

    current = []

    until i == 1 || i.negative?
      current << i
      i = i.odd? ? (3 * i) + 1 : i / 2
    end

    current_size = current.size + 1

    if current_size > longest_chain
      longest_chain = current_size
      number = current_num
    end
  end

  [longest_chain, number]
end

puts solution
