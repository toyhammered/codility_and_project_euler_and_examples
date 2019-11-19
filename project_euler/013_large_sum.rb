def solution
  total = 0

  file.each_line do |line|
    total += line.to_i
  end

  total.to_s[0..9]
end

def file
  @file ||= File.read('lib/013_large_sum/numbers.txt')
end

puts solution
