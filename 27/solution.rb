# Euler discovered the remarkable quadratic formula:
# n*n+n+41
# It turns out that the formula will produce 40 primes for the consecutive integer
#   values 0≤n≤39.
#  However, when n=40,40*40+40+41=40(40+1)+41 is divisible
#   by 41, and certainly when n=41,41*41+41+41 is clearly divisible by 41.

# The incredible formula n*n−79n+1601 was discovered, which
#  produces 80 primes for the consecutive values 0≤n≤79. The product of the
#  coefficients, −79 and 1601, is −126479.

# Considering quadratics of the form:
# n*n+an+b, where |a|<1000| and |b|≤1000
# where |n| is the modulus/absolute value of n
# e.g. |11|=11 and |−4|=4
# Find the product of the coefficients, a and b, for the quadratic
#  expression that produces the maximum number of primes for consecutive
#  values of n, starting with n=0.
# Time to complete: 20 minutes + prime
# Important to know:
#  - negative numbers are not prime
#  - 1 is not a prime

require_relative '../lib/util'

def validate(n:, a:, b:)
  (0..n-1).all? do |curr_n|
    Util.prime?(curr_n * curr_n + a * curr_n + b)
  end
end

max_a = 999
max_b = 1_000

possible_bs = (0..max_b).select { |b| Util.prime?(b) }

curr_a = curr_b = nil
curr_n = -1

(0-max_a..max_a).each do |a|
    possible_bs.each do |b|
    n = 0
    while Util.prime?(n * n + a * n + b)
      n += 1
    end
    if n > curr_n
      curr_n = n
      curr_a = a
      curr_b = b
    end
  end
end

p "Valid? #{validate(n: curr_n, a: curr_a, b: curr_b)}"
p "Product: #{curr_a * curr_b}"
