# The series, 1 ** 1 + 2 ** 2 + 3 ** 3 + ... + 10 ** 10 = 10405071317.

# Find the last ten digits of the series, 1 ** 1 + 2 ** 2 + 3 ** 3 + ... + 1000 ** 1000.
# Time to complete: 5 minutes

max = 1_000
total = (1..max).reduce(0) do |sum, i|
  sum + i ** i
end

p total.to_s[-10..-1]
