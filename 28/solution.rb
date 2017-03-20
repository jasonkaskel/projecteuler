# Starting with the number 1 and moving to the right in a clockwise direction
#   a 5 by 5 spiral is formed as follows:

# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13

# It can be verified that the sum of the numbers on the diagonals is 101.

# What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral
#   formed in the same way?

# 73 74 75 76 77 78 79 80 81
# 72 43 44 45 46 47 48 49 50
# 71 42 21 22 23 24 25 26 51
# 70 41 20  7  8  9 10 27 52
# 69 40 19  6  1  2 11 28 53
# 68 39 18  5  4  3 12 29 54
# 67 38 17 16 15 14 13 30 55
# 66 37 36 35 34 33 32 31 56
# 65 64 63 62 61 60 59 58 57
#
# 1: 1
# 3: 3 5 7 9        (starting at last + 2, incrementing by 2)
# 5: 13 17 21 25    (starting at last + 4, incrementing by 4)
# 7: 31 37 43 49    (starting at last + 6, incrementing by 6)
# 9: 57 65 73 81    (starting at last + 8, incrementing by 8)

# Time to complete: 20 minutes

goal = 1_001

diagonal_sums = (3..goal).step(2).reduce([1]) do |array, i|
  inc = i - 1
  last_corner = array.last
  array += [
    last_corner + inc,
    last_corner + inc + inc,
    last_corner + inc + 2 * inc,
    last_corner + inc + 3 * inc
  ]
end

p diagonal_sums.reduce(0) { |sum, i| sum + i }
