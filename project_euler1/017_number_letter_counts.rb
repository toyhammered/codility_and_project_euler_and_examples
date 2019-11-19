require 'humanize'

def solution
  total = 0

  (1..1000).each do |i|
    total += i.humanize.tr(' ', '').tr('-', '').size
  end

  total
end

p solution
