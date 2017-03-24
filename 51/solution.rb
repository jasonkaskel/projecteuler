# By replacing the 1st digit of the 2-digit number *3, it turns out that
#  six of the nine possible values: 13, 23, 43, 53, 73, and 83, are all prime.

# By replacing the 3rd and 4th digits of 56**3 with the same digit, this
#  5-digit number is the first example having seven primes among the ten
#  generated numbers, yielding the family:
#  56003, 56113, 56333, 56443, 56663, 56773, and 56993.
#  Consequently 56003, being the first member of this family, is the
#  smallest prime with this property.

# Find the smallest prime which, by replacing part of the number
#  (not necessarily adjacent digits) with the same digit, is part
#  of an eight prime value family.
# Time to complete: 2 hours

require_relative '../lib/util'

def special_permutation(set, swap_set)
  return_set = {}

  swap_set.each do |swap|
    idx_permutations = (0..set.size-1).to_a.permutation(swap.size).to_a.uniq do |perm|
      perm.sort
    end

    idx_permutations.each do |idxs|
      to_add = idxs.each_with_object(set.dup) do |idx, to_add|
        to_add[idx] = swap.first
      end
      next if to_add.first == 0

      return_set[idxs] ||= []
      if Util.prime?(to_add.join('').to_i) && !return_set[idxs].include?(to_add)
        return_set[idxs] << to_add
      end
    end
  end

  return_set
end

def numbers_to_swap(size)
  (1..size-1).each_with_object([]) do |i, array|
    (0..9).each { |j| array << [j] * i }
  end
end

max_primes = 999_999 # a guess
primes = (1..max_primes).each_with_object({}) do |n, hash|
  if Util.prime?(n)
    hash[n] = 1
  end
end

numbers_to_swap_by_size = (0..6).reduce({}) do |hash, size|
  hash.merge(size => numbers_to_swap(size))
end

primes.keys.detect do |prime|
  numbers = prime.to_s.split(/(?=.)/).map(&:to_i)

  numbers_to_swap = numbers_to_swap_by_size[numbers.size]

  prime_permutations = special_permutation(numbers, numbers_to_swap)

  found = prime_permutations.detect do |swap, subprimes|
    subprimes.size >= 8
  end

  if found
    pp prime_permutations.map_by { |_, v| v.size }
  end
  found
end
