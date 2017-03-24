# It can be seen that the number, 125874, and its double, 251748, contain exactly
#  the same digits, but in a different order.

# Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x,
#  contain the same digits.
# Time to complete: 5 minutes

def same_digits?(a, b)
  return a != b &&
    a.to_s.split(/(?=.)/).sort == b.to_s.split(/(?=.)/).sort
end

max = 1_000_000 # a guess

answer = (1..max).detect do |i|
  (2..6).all? do |x|
    same_digits?(i, x * i)
  end
end

p answer
