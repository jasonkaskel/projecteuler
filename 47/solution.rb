# The first two consecutive numbers to have two distinct prime factors are:

# 14 = 2 × 7
# 15 = 3 × 5

# The first three consecutive numbers to have three distinct prime factors are:

# 644 = 2² × 7 × 23
# 645 = 3 × 5 × 43
# 646 = 2 × 17 × 19.

# Find the first four consecutive integers to have four distinct prime factors each.
#  What is the first of these numbers?
# Time to complete: 7:45

require_relative '../lib/util'

max = 1_000_000 # a guess
@primes = (1..max).select { |i| Util.prime?(i) }
def distinct_primes(i)
  return 0 if Util.prime?(i)

  array = []

  loop do
    prime_factor = @primes.detect do |prime|
      i % prime == 0
    end
    array << prime_factor
    i = i / prime_factor

    if Util.prime?(i)
      array << i
      break
    end
  end

  array.uniq.size
end

target = 4
curr = 3
count = 0

while count < target
  if distinct_primes(curr) == target
    count += 1
  else
    count = 0
  end
  curr += 1
end

p curr - target
