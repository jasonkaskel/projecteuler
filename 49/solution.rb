# The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases
#   by 3330, is unusual in two ways:
#  (i) each of the three terms are prime, and,
#  (ii) each of the 4-digit numbers are permutations of one another.

# There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes,
#  exhibiting this property, but there is one other 4-digit increasing sequence.

# What 12-digit number do you form by concatenating the three terms in this sequence?
# Time to complete: 1 hour

require_relative '../lib/util'

primes = (1000..9999).select { |i| Util.prime?(i) } - [1487]
primes_by_permutations = primes.reduce({}) do |hash, prime|
  permutations = prime.to_s.split(/(?=.)/).permutation(4).reduce([]) do |array, permutation|
    as_i = permutation.join('').to_i
    if primes.include?(as_i) && permutation.join('') == as_i.to_s && !array.include?(as_i)
      array + [as_i]
    else
      array
    end
  end

  if permutations.size >= 3
    hash.merge(prime => permutations)
  else
    hash
  end
end


special = primes_by_permutations.reduce do |match, (prime, _)|
  permutations = primes_by_permutations[prime]
  ascending_triplets = permutations.permutation(3).reduce([]) do |array, perm|
    if !array.include?(perm) &&
         perm[2] > perm[1] && perm[1] > perm[0] &&
         perm[1] - perm[0] == perm[2] - perm[1]
      array + [perm]
    else
      array
    end
  end

  if ascending_triplets.any?
    ascending_triplets
  else
    match
  end
end

p special.flatten.join('')
