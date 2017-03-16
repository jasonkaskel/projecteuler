# The sum of the squares of the first ten natural numbers is,
# 1*1 + 2*2 + ... + 10*10 = 385
# The square of the sum of the first ten natural numbers is,
# (1 + 2 + ... + 10)*(1 + 2 + ... + 10) = 55*55 = 3025
# Hence the difference between the sum of the squares of the
#  first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

# Find the difference between the sum of the squares of the
#  first one hundred natural numbers and the square of the sum.
# Time to complete: 1 minute

range = (1..100)
sum_of_square = range.reduce(0) { |sum, i| sum += i * i }
sum           = range.reduce(0) { |sum, i| sum + i }
square_of_sum = sum * sum
p square_of_sum - sum_of_square
