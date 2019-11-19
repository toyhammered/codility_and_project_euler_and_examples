def solution
  number = 20

  loop do
    print "#{number}|"

    20.downto(11) do |i|
      break unless (number % i).zero?

      return number if i == 11
    end

    number += 20
  end
end
