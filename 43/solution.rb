# The number, 1406357289, is a 0 to 9 pandigital number because it is made up of each
#   of the digits 0 to 9 in some order, but it also has a rather interesting
#   sub-string divisibility property.

# Let d(1) be the 1st digit, d(2) be the 2nd digit, and so on. In this way, we note the
#  following:

# d(2)d(3)d(4)=406 is divisible by 2
# d(3)d(4)d(5)=063 is divisible by 3
# d(4)d(5)d(6)=635 is divisible by 5
# d(5)d(6)d(7)=357 is divisible by 7
# d(6)d(7)d(8)=572 is divisible by 11
# d(7)d(8)d(9)=728 is divisible by 13
# d(8)d(9)d(10)=289 is divisible by 17
# Find the sum of all 0 to 9 pandigital numbers with this property.
# Time to complete: 15 minutes

def pandigitals(set)
  array = []

  set.permutation.each do |permutation|
    if permutation.first != '0'
      array << permutation.join('')
    end
  end

  array
end

def interesting?(num_as_str)
  num_as_str[7..9].to_i % 17 == 0 &&
    num_as_str[6..8].to_i % 13 == 0 &&
    num_as_str[5..7].to_i % 11 == 0 &&
    num_as_str[4..6].to_i % 7 == 0 &&
    num_as_str[3..5].to_i % 5 == 0 &&
    num_as_str[2..4].to_i % 3 == 0 &&
    num_as_str[1..3].to_i % 2 == 0
end

SET = ('0'..'9').to_a

all_pandigitals = pandigitals(SET)
interesting_pandigitals = all_pandigitals.select do |pandigital|
  interesting?(pandigital)
end

p interesting_pandigitals.map(&:to_i).reduce(:+)
