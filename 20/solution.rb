# n! means n × (n − 1) × ... × 3 × 2 × 1
# For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
# and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
# Find the sum of the digits in the number 100!
# Time to complete: 5 minutes

max_number = 100
factorial = (max_number - 1).downto(1).reduce(max_number) { |product, i| product * i }
digits = factorial.to_s.split(/(?=.)/).map(&:to_i)
p digits.reduce(0) { |sum, i| sum + i }
