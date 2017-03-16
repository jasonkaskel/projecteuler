require 'pp'

module Util
  def self.prime?(num)
    if num <= 1
      return false
    elsif num <= 3
      return true
    elsif num % 2 == 0 or num % 3 == 0
      return false
    else
      curr = 5
      while curr * curr <= num
        if num % curr == 0 or num % (curr + 2) == 0
          return false
        end
        curr += 6
      end
    end
    return true
  end

  def self.first_primes(num)
    primes = []
    curr = 2
    loop do
      primes << curr if prime?(curr)
      cur += 1
      break if primes.size >= num
    end
  end

  def self.product(numbers)
    numbers.last(numbers.size-1).reduce(numbers.first) { |product, i| product * i }
  end

  def self.sum(numbers)
    numbers.reduce(0) { |sum, i| sum + i }
  end
end
