# The primes 3, 7, 109, and 673, are quite remarkable. By taking any two primes
#  and concatenating them in any order the result will always be prime.
#  For example, taking 7 and 109, both 7109 and 1097 are prime. The sum of these
#  four primes, 792, represents the lowest sum for a set of four primes with
#  this property.

# Find the lowest sum for a set of five primes for which any two primes
#  concatenate to produce another prime.
# Time to complete: 45 minutes

require_relative '../lib/util'

MAX = 10_000 # a guess

@prime_cache = {}
def prime?(num)
  return @prime_cache[num] if @prime_cache.key?(num)
  @prime_cache[num] = Util.prime?(num)
  @prime_cache[num]
end

def all_concat_prime?(set)
  set.permutation(2).all? do |permutation|
    check = permutation.join.to_i
    prime?(check)
  end
end

(1..MAX).each do |prime|
  next unless prime?(prime)
  set = [prime]
  (1..MAX).each do |prime2|
    next if set.include? prime2
    next unless prime?(prime2)
    next unless all_concat_prime?(set + [prime2])
    set += [prime2]
    (1..MAX).each do |prime3|
      next if set.include? prime3
      next unless prime?(prime3)
      next unless all_concat_prime?(set + [prime3])
      set += [prime3]
      (1..MAX).each do |prime4|
        next if set.include? prime4
        next unless prime?(prime4)
        next unless all_concat_prime?(set + [prime4])
        set += [prime4]
        (1..MAX).each do |prime5|
          next if set.include? prime5
          next unless prime?(prime5)
          next unless all_concat_prime?(set + [prime5])
          set += [prime5]

          p set
          p set.reduce(:+)
          exit
        end
      end
    end
  end
end
