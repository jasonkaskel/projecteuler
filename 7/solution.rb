# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13,
#   we can see that the 6th prime is 13.
# What is the 10 001st prime number?
# Time to complete: 10 minutes

require_relative '../lib/util'

max_primes = 10001
primes = []
current = 2
answer =
  loop do
    primes << current if Util.prime?(current)
    break primes.last if primes.size >= max_primes-1 # -1 b/c 0 index
    current += 1
  end
p answer
