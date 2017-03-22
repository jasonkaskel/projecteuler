# We shall say that an n-digit number is pandigital if it makes use of all the digits
#   1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.

# What is the largest n-digit pandigital prime that exists?
# Time to complete: 10 minutes

require_relative '../lib/util'

def pandigital?(num)
  num_as_str = num.to_s

  ('1'..num_as_str.size.to_s).all? { |i| num_as_str.include? i }
end

MAX_NUMBER = 7_654_321 # a guess

largest = nil
MAX_NUMBER.downto(1).each do |i|
  break unless largest.nil?
  next unless pandigital?(i) && Util.prime?(i)
  largest = i
end

p largest
