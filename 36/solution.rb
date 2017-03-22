# The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.

# Find the sum of all numbers, less than one million, which are palindromic in
#   base 10 and base 2.

# (Please note that the palindromic number, in either base, may not include
#   leading zeros.)
# Time to complete: 20 minutes

MAX_POWER_OF_TWO = 20 # 2 ** 20 > 1_000_000

def base10_to_base2(num)
  base2_ary = []

  MAX_POWER_OF_TWO.downto(0).each do |pow|
    if 2 ** pow <= num
      base2_ary << num / 2 ** pow
      num = num % 2 ** pow
    else
      base2_ary << 0
    end
  end

  base2_ary.join('').to_i
end

def palindrome?(num)
  num.to_s == num.to_s.reverse
end

palindromics = (0..1_000_000).select do |i|
  palindrome?(i) && palindrome?(base10_to_base2(i))
end

p palindromics.reduce(:+)
