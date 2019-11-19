def mapping
  @mapping ||= ('a'..'z').map.with_index(1) { |letter, i| [letter, i] }.to_h
end

def sorted_names
  return @sorted_names if @sorted_names

  names = []

  file.split(',').each do |name|
    names << name.downcase
  end

  @sorted_names = names.sort
  @sorted_names
end

def file
  @file ||= File.read('lib/022_names_scores/names.txt').tr("\"", '').tr(' ', '').chomp
end

def solution
  total = 0

  sorted_names.each.with_index(1) do |name, index|
    current_score = 0

    name.split('').each do |letter|
      current_score += mapping[letter]
    end

    total += current_score * index
  end

  total
end

p solution
