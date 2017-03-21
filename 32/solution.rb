# We shall say that an n-digit number is pandigital if it makes use of all the digits
#   1 to n exactly once; for example, the 5-digit number, 15234,
#   is 1 through 5 pandigital.

# The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing
#  multiplicand, multiplier, and product is 1 through 9 pandigital.

# Find the sum of all products whose multiplicand/multiplier/product identity
#  can be written as a 1 through 9 pandigital.

# HINT: Some products can be obtained in more than one way so be sure to only
#  include it once in your sum.
# Time to complete: 20 minutes

pandigitals = {}
(1..99).each do |a|
  (1..9999).each do |b|
    numbers = (a.to_s + b.to_s).split(/(?=.)/).map(&:to_i)
    next unless numbers.size == numbers.uniq.size

    product = a * b
    numbers += product.to_s.split(/(?=.)/).map(&:to_i)

    if numbers.size == numbers.uniq.size &&
       numbers.size == 9 && !numbers.include?(0)
      pandigitals[a*b] = [a, b]
    end
  end
end

p pandigitals.keys.reduce(0) { |sum, i| sum + i }
