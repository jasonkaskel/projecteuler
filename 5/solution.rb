# 2520 is the smallest number that can be divided by each of the numbers
#  from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all
#  of the numbers from 1 to 20?
# Time to complete: 15 minutes

require_relative '../lib/util'

def divisible_by_range?(num, range)
  range.all? { |i| num % i == 0 }
end

range = (1..20)
min = Util.product(range.select { |i| Util.prime?(i) })
current = min
answer =
  loop do
    break current if divisible_by_range?(current, range)
    current += min
  end
p answer
