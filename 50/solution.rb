# The prime 41, can be written as the sum of six consecutive primes:

# 41 = 2 + 3 + 5 + 7 + 11 + 13
# This is the longest sum of consecutive primes that adds to a prime below one-hundred.

# The longest sum of consecutive primes below one-thousand that adds to a prime,
#  contains 21 terms, and is equal to 953.

# Which prime, below one-million, can be written as the sum of the most consecutive
#  primes?
# Time to complete: 45 minutes

require_relative '../lib/util'

primes = (1..20000).select { |i| Util.prime?(i) }
MAX_GUESS = 700

max_primes = 0
found_prime = nil
range = nil

primes.each.with_index do |prime, idx|
  MAX_GUESS.downto(500).each do |consecutive_primes|
    subprime = primes[idx..idx+consecutive_primes-1]
    sum = subprime.reduce(:+)
    if subprime.size == consecutive_primes && sum < 1_000_000 && Util.prime?(sum) && consecutive_primes > max_primes
      max_primes = consecutive_primes
      found_prime = sum
      range = subprime
    end
  end
end

p found_prime
p max_primes
p range
