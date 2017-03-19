# Let d(n) be defined as the sum of proper divisors of n (numbers less than n
#   which divide evenly into n).
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable
#   pair and each of a and b are called amicable numbers.

# For example, the proper divisors of 220 are
#  1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110;
#  therefore d(220) = 284. The proper divisors of 284 are
#  1, 2, 4, 71 and 142; so d(284) = 220.

# Evaluate the sum of all the amicable numbers under 10000.
# Time to complete: 15 minutes

def divisors_of(n)
  divisors = [1]
  (2..n/2).each_with_object(divisors) do |i, divisors|
    divisors << i if n % i == 0
  end
end

start_at = 1
end_at = 10_000

dn = (start_at..end_at).reduce({}) do |hash, a|
  hash.merge(a => divisors_of(a).reduce(0) { |sum, i| sum + i })
end

amicable_numbers = dn.select do |a, b|
  a != b && a == dn[b]
end

p amicable_numbers.reduce(0) { |sum, (a, b)| sum + a }
