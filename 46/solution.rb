# It was proposed by Christian Goldbach that every odd composite number can be written
#  as the sum of a prime and twice a square.

# 9 = 7 + 2×1 ** 2
# 15 = 7 + 2×2 ** 2
# 21 = 3 + 2×3 ** 2
# 25 = 7 + 2×3 ** 2
# 27 = 19 + 2×2 ** 2
# 33 = 31 + 2×1 ** 2

# It turns out that the conjecture was false.

# What is the smallest odd composite that cannot be written as the sum of a prime and
#  twice a square?
# Time to complete: 15 minutes

require_relative '../lib/util'

@primes = (1..1_000_000).select { |i| Util.prime?(i) }
def primes_less_than(num)
  array = []

  idx = 0
  loop do
    break if @primes[idx] > num

    array << @primes[idx]
    idx += 1
  end

  array
end

def goldbach?(num)
  subprimes = primes_less_than(num)

  subprimes.any? do |prime|
    remainder = num - prime

    (1..remainder/2).any? do |y|
      remainder == 2 * y ** 2
    end
  end
end

def composite?(num)
  (2..num-1).any? do |i|
    num % i == 0
  end
end

MAX = 1_000_000 # a guess
found = (1..MAX).step(2).detect do |i|
  composite?(i) && !goldbach?(i)
end

p found
