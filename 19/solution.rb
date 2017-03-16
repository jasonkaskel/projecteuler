# You are given the following information, but you may prefer to do some
#   research for yourself.

# 1 Jan 1900 was a Monday.
# Thirty days has September,
# April, June and November.
# All the rest have thirty-one,
# Saving February alone,
# Which has twenty-eight, rain or shine.
# And on leap years, twenty-nine.
# A leap year occurs on any year evenly divisible by 4,
#   but not on a century unless it is divisible by 400.
# How many Sundays fell on the first of the month during
#   the twentieth century (1 Jan 1901 to 31 Dec 2000)?

def year_month_day_day_of_week(days)
  start_day_of_week = 2 # 1901-01-01; Tuesday

  day_of_week = (days - 6) % 7
  year, days = parse_years(days)
  month, days = parse_month(days, leap?(year))

  [year, month, days, day_of_week]
end

def parse_years(days)
  year = 1901

  while (leap?(year) && days >= 366) || days >= 365
    days -= leap?(year) ? 366 : 365
    year += 1
  end

  [year, days]
end

MONTH_DAYS = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
def parse_month(days, leap)
  month_days = MONTH_DAYS.dup
  month_days[1] = 29 if leap
  min_days = month_days.min

  month = 1
  while days > min_days
    days -= month_days[month-1]
    month +=1
  end

  [month, days]
end

def leap?(year)
  year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)
end

curr_day = 1
sundays_on_first = 0
loop do
  ymdw = year_month_day_day_of_week(curr_day)
  sundays_on_first += 1 if ymdw[2] == 1 && ymdw[3] == 1
  break if ymdw.first(3).join('-') >= '2000-12-31'
  curr_day +=1
end

p sundays_on_first
