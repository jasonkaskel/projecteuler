# The number, 197, is called a circular prime because all rotations of the digits:
#   197, 971, and 719, are themselves prime.
# There are thirteen such primes below 100:
#   2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
# How many circular primes are there below one million?
# Time to complete: 15 minutes

require_relative '../lib/util'

def rotations_of(num)
  rotations = [num]

  num_as_ary = num.to_s.split(/(?=.)/)
  loop do
    num_as_ary = num_as_ary[1..-1] + [num_as_ary[0]]
    break if num_as_ary.join('').to_i == num
    rotations << num_as_ary.join('').to_i
  end

  rotations
end

max = 1_000_000

circular_primes = (1..max).select do |i|
  Util.prime?(i) &&
    rotations_of(i).all? { |j| Util.prime?(j) }
end

p circular_primes.size
