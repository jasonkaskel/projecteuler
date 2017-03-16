# The following iterative sequence is defined for the set of positive integers:
# n → n/2 (n is even)
# n → 3n + 1 (n is odd)

# Using the rule above and starting with 13, we generate the following sequence:
# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains
#   10 terms. Although it has not been proved yet (Collatz Problem), it is
#   thought that all starting numbers finish at 1.

# Which starting number, under one million, produces the longest chain?
# NOTE: Once the chain starts the terms are allowed to go above one million.
# Time to complete: 10 minutes
# Time to execute: 50s

def next_collatz(num)
  if num % 2 == 0
    num / 2
  else
    num * 3 + 1
  end
end

def collatz(num)
  sequence = [num]
  if num == 1
    sequence += collatz(next_collatz(1))
  else
    while num != 1
      num = next_collatz(num)
      sequence << num
    end
  end
  sequence
end

max_starting_number = 1_000_000
sequences = (1..max_starting_number).map do |i|
  {
    starting_number: i,
    sequence: collatz(i)
  }
end
p sequences.max_by { |sequence| sequence[:sequence].size }[:starting_number]

