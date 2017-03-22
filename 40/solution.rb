# An irrational decimal fraction is created by concatenating the positive integers:

# 0.123456789101112131415161718192021...
#              ^
# It can be seen that the 12th digit of the fractional part is 1.

# If d(n) represents the nth digit of the fractional part,
#  find the value of the following expression.

# d(1) × d(10) × d(100) × d(1000) × d(10000) × d(100000) × d(1000000)
# Time to complete: 10 minutes

MAX_DIGITS = 1_000_000
TARGET_INDEXES = [1, 10, 100, 1000, 10000, 100000, 1000000]

fraction_str = ''
counter = 1
while fraction_str.size < MAX_DIGITS
  fraction_str += counter.to_s
  counter += 1
end

value = TARGET_INDEXES.drop(1).reduce(fraction_str[TARGET_INDEXES.first-1].to_i) do |product, i|
  product * fraction_str[i-1].to_i
end

p value
