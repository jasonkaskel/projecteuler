# A palindromic number reads the same both ways. The largest palindrome made
#  from the product of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.
# Time to complete: 5 minutes

def palindrome?(num)
  num_as_str = num.to_s
  num_as_str == num_as_str.reverse
end

min = 100
max = 999
palindromes = []
max.downto(min).each do |x|
  max.downto(min).each do |y|
    palindromes << x * y if palindrome?(x * y)
  end
end
p palindromes.max
