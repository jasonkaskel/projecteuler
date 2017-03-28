# Starting with 1 and spiralling anticlockwise in the following way, a square
#  spiral with side length 7 is formed.

# 65 64 63 62 61 60 59 58 57
# 66 37 36 35 34 33 32 31 56
# 67 38 17 16 15 14 13 30 55
# 68 39 18  5  4  3 12 29 54
# 69 40 19  6  1  2 11 28 53
# 70 41 20  7  8  9 10 27 52
# 71 42 21 22 23 24 25 26 51
# 72 43 44 45 46 47 48 49 50
# 73 74 75 76 77 78 79 80 81

# It is interesting to note that the odd squares lie along the bottom right
#  diagonal, but what is more interesting is that 8 out of the 13 numbers
#  lying along both diagonals are prime; that is, a ratio of 8/13 ≈ 62%.

# If one complete new layer is wrapped around the spiral above, a square
#  spiral with side length 9 will be formed. If this process is continued,
#  what is the side length of the square spiral for which the ratio of
#  primes along both diagonals first falls below 10%?
# Time to complete: 30 minutes

require_relative '../lib/util'

diagonals = [1]
prime_count = 0
max_row_length = 1_000_000

result = (3..max_row_length).step(2).detect do |row_length|
  last_val = diagonals.last
  (1..4).each do |x|
    val = last_val + x * (row_length - 1)
    diagonals << val
    prime_count += 1 if Util.prime?(val)
  end

  prime_count / diagonals.size.to_f <= 0.1
end

p result
