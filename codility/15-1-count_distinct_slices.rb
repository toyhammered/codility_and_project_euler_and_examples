def solution(_m, array)
  array_size = array.size
  distinct_slices = 0

  array_size.times do |back|
    (back..array_size - 1).each do |front|
      if array[back..front] == array[back..front].uniq
        distinct_slices += 1
      else
        break
      end
    end
  end

  distinct_slices
end
