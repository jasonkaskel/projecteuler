# The number 3797 has an interesting property. Being prime itself, it is possible
#   to continuously remove digits from left to right, and remain prime at each stage:
#  3797, 797, 97, and 7. Similarly we can work from right to left:
#   3797, 379, 37, and 3.

# Find the sum of the only eleven primes that are both truncatable from left to right
#   and right to left.

# NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.

require_relative '../lib/util'

def truncated(num)
  num_as_str = num.to_s
  (0..num_as_str.size-1).reduce([]) do |array, i|
    array + [num_as_str[i..-1].to_i] + [num_as_str[0..i].to_i]
  end.uniq - [num]
end

MAX_NUMBER = 1_000_000

truncatable_primes = (10..MAX_NUMBER).select do |i|
  Util.prime?(i) &&
    truncated(i).all? { |j| Util.prime?(j) }
end

p truncatable_primes.reduce(:+)
