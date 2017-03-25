# It is possible to show that the square root of two can be expressed as an
#  infinite continued fraction.

# √ 2 = 1 + 1/(2 + 1/(2 + 1/(2 + ... ))) = 1.414213...

# By expanding this for the first four iterations, we get:

# 1 + 1/2 = 3/2 = 1.5
# 1 + 1/(2 + 1/2) = 7/5 = 1.4
# 1 + 1/(2 + 1/(2 + 1/2)) = 17/12 = 1.41666...
# 1 + 1/(2 + 1/(2 + 1/(2 + 1/2))) = 41/29 = 1.41379...

# The next three expansions are 99/70, 239/169, and 577/408, but the eighth
#  expansion, 1393/985, is the first example where the number of digits in the
#  numerator exceeds the number of digits in the denominator.

# In the first one-thousand expansions, how many fractions contain a numerator
#  with more digits than denominator?
# Time to complete: 10 minutes

def digit_count(num)
  num.to_s.split(/(?=.)/).size
end

answer = (2..1000).select do |expansions|
  expanded = (2..expansions).reduce({numerator: 3, denominator: 2}) do |hash, _|
    next_numerator = hash[:numerator] + 2 * hash[:denominator]
    next_denominator = hash[:numerator] + hash[:denominator]

    hash.merge(
      numerator: next_numerator,
      denominator: next_denominator
    )
  end

  digit_count(expanded[:numerator]) > digit_count(expanded[:denominator])
end

p answer.size
