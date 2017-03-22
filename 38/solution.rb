# Take the number 192 and multiply it by each of 1, 2, and 3:
# 192 × 1 = 192
# 192 × 2 = 384
# 192 × 3 = 576
# By concatenating each product we get the 1 to 9 pandigital, 192384576.
#  We will call 192384576 the concatenated product of 192 and (1,2,3)

# The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5
#   giving the pandigital, 918273645, which is the concatenated product of
#   9 and (1,2,3,4,5).

# What is the largest 1 to 9 pandigital 9-digit number that can be formed
#  as the concatenated product of an integer with (1,2, ... , n) where n > 1?
# Time to complete: 15 minutes

def pandigitize(num, set)
  set.reduce('') do |cat_product, i|
    cat_product += (num * i).to_s
  end
end

def pandigital?(num)
  num_as_str = num.to_s

  num_as_str.size == 9 &&
    ('1'..'9').all? { |c| num_as_str.include? c }
end

MAX_NUMBER = 10_000 # a guess
SET = (1..30).to_a  # also a guess

pandigitals = []
(1..MAX_NUMBER).each do |i|
  (1..SET.size).each do |set_idx|
    subset = SET[0..set_idx]
    if pandigital?(pandigitize(i, subset))
      pandigitals << [pandigitize(i, subset), i, subset]
    end
  end
end

p pandigitals.sort_by { |pan| pan.first }.reverse.first.first.to_i
