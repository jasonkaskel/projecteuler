# A unit fraction contains 1 in the numerator. The decimal representation of the unit
#  fractions with denominators 2 to 10 are given:
# 1/2 =   0.5
# 1/3 =   0.(3)
# 1/4 =   0.25
# 1/5 =   0.2
# 1/6 =   0.1(6)
# 1/7 =   0.(142857)
# 1/8 =   0.125
# 1/9 =   0.(1)
# 1/10=   0.1
# Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle.
#  It can be seen that 1/7 has a 6-digit recurring cycle.

# Find the value of d < 1000 for which 1/d contains the longest
#  recurring cycle in its decimal fraction part.
# Time to complete: 30 minutes

require 'bigdecimal'

def get_recurring_cycle(num_str)
  return '' unless num_str.length > 1

  substr = num_str[0]
  curr = 0
  loop do
    curr += 1
    compare_str = num_str[curr..-1]
    substr_idx = compare_str.index(substr)
    break if substr_idx.nil? || curr > num_str.size
    break curr if substr_idx == 0
    substr += num_str[curr]
  end
  substr
end

max = 1_000
longest_size = 0
value = 0

(1..max).each do |i|
  unit_fraction = BigDecimal.new(1).div(BigDecimal.new(i), 10_000)
  after_decimal = unit_fraction.to_s.split('.').last.split('E').first
  recurring_cycle = get_recurring_cycle(after_decimal)
  if recurring_cycle.size > longest_size
    longest_size = recurring_cycle.size
    value = i
  end
end

p value
