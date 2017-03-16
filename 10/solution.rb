# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.
# Time to complete: 15 minutes

require_relative '../lib/util'

max = 2_000_000

curr = 2
primes = []
loop do
  primes << curr if Util.prime?(curr)
  curr += 1
  break if curr > max
end
p Util.sum(primes)
