def solution(array)
  peaks = find_peaks(array)
  max_flags = peaks.size

  max_flags.downto(1) do |i|
    total_flags = 1
    current_distance = 0

    peaks[1..-1].each do |peak|
      current_distance = peak[:distance] + current_distance

      if current_distance > i
        current_distance = 0
        total_flags += 1
      else
        current_distance += peak[:distance]
      end
    end

    return total_flags if total_flags == i
  end
end

def find_peaks(array)
  peaks = []

  array.each_with_index do |num, index|
    left = array[index - 1]
    right = array[index + 1] || array[0]

    next unless num > left && num > right

    current = {
      index: index,
      distance: -1
    }

    if !peaks.empty?
      previous = peaks.last
      current[:distance] = (previous[:index] - current[:index]).abs
    end

    peaks << current
  end

  peaks
end
