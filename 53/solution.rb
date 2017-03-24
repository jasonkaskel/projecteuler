# There are exactly ten ways of selecting three from five, 12345:

# 123, 124, 125, 134, 135, 145, 234, 235, 245, and 345

# In combinatorics, we use the notation, 5(C(3)) = 10.

# In general,

# n(C(r)) = n! / (r! * (n-r)!), where r ≤ n, n! = n×(n−1)×...×3×2×1, and 0! = 1.
# It is not until n = 23, that a value exceeds one-million: 23(C(10)) = 1144066.

# How many, not necessarily distinct, values of  n(C(r)), for 1 ≤ n ≤ 100,
#  are greater than one-million?
# Time to complete: 10 minutes

def factorial(num)
  return 1 if num == 0
  (1..num).reduce(:*)
end

def formula(n:, r:)
  factorial(n) / (factorial(r) * factorial(n - r))
end

min = 1
max = 100
results = []
(min..max).each do |n|
  (min...n).each do |r|
    results << [n, r] if formula(n: n, r: r) > 1_000_000
  end
end

p results.size
