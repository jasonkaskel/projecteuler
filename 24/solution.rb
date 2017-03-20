# A permutation is an ordered arrangement of objects. For example, 3124 is one
#   possible permutation of the digits 1, 2, 3 and 4. If all of the permutations
#   are listed numerically or alphabetically, we call it lexicographic order.
#   The lexicographic permutations of 0, 1 and 2 are:

# 012   021   102   120   201   210

# 0, 1, 2, 3
# 0123 0132 0213 0231 0312 0321 1023 1032 1203 1230 1302 1320
# 2013 2031 2103 2130 2301 2310 3012 3021 3102 3120 3201 3210

# What is the millionth lexicographic permutation of the digits
#  0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
# Time to complete: 30 minutes

def product(nums)
  nums.drop(1).reduce(nums.first) { |product, i| product * i }
end

def permutation_count(size)
  product((2..(size-1)))
end

def permutations(set)
  array = []
  set.each do |i|
    first, rest = set.partition { |j| i == j }
    if rest.size == 1
      array += ["#{first.first}#{rest.first}"]
    else
      array += permutations(rest).map do |perm|
        "#{first.first}#{perm}"
      end
    end
  end
  array
end

goal = 1_000_000
curr = goal
set = (0..9).to_a
result = ""
while set.size > 3
  count = permutation_count(set.size)
  index_to_splice = curr / count
  result += set[index_to_splice].to_s
  set = set[0..index_to_splice-1] + set[index_to_splice+1,set.size-1]
  curr = curr % count
end

perms = permutations(set)
result += perms[curr-1]

p result
