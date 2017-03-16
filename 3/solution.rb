# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?
# Time to complete: 10 minutes

require_relative '../lib/util'

def smallest_factor(num)
  current = 2
  loop do
    break current if num % current == 0
    current += 1
  end
end

target = 600_851_475_143
answer =
  loop do
    factor = smallest_factor(target)
    multiple = target / factor
    break multiple if Util.prime?(multiple)
    target = multiple
  end
p answer
