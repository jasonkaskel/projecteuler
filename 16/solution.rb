# 2 ** 15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
# What is the sum of the digits of the number 2 ** 1000?
# Time to complete: 2 minutes

require_relative '../lib/util'

total = 2 ** 1000
p Util.sum(total.to_s.split(/(?=.)/).map(&:to_i))
