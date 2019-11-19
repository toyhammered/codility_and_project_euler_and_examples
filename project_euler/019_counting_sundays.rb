def solution
  total_sundays = 0

  # Sunday is 1
  week_day = 3

  (1901..2000).each do |year|
    (1..12).each do |month|
      (1..days_per_month(month, year)).each do |day|
        total_sundays += 1 if sunday?(week_day) && day == 1
        week_day = day_counter(week_day)
      end
    end
  end

  total_sundays
end

def day_counter(day)
  day == 7 ? day = 1 : day += 1
  day
end

def sunday?(day)
  day == 1
end

def days_per_month(month, year)
  case month
  # April, June, November, September
  when 4, 6, 9, 11
    30
  # February
  when 2
    leap_year?(year) ? 29 : 28
  else
    31
  end
end

def leap_year?(year)
  return true if (year % 400).zero?
  return true if (year % 4).zero?

  false
end

p solution
