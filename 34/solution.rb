# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

# Find the sum of all numbers which are equal to the sum of the factorial
#   of their digits.

# Note: as 1! = 1 and 2! = 2 are not sums they are not included.
# Time to complete: 1 hour

max_factorial = 9

factorials = (2..max_factorial).reduce([1, 1]) do |array, i|
  array + [(1..i).reduce(:*)]
end

curious_numbers = []

(0..max_factorial).each do |i|
  fi = factorials[i]
  (0..max_factorial).each do |j|
    fj = factorials[j]
    (0..max_factorial).each do |k|
      fk = factorials[k]
      (0..max_factorial).each do |l|
        fl = factorials[l]
        (0..max_factorial).each do |m|
          fm = factorials[m]
          (0..max_factorial).each do |n|
            fn = factorials[n]
            curious_numbers << "#{i}#{j}#{k}#{l}#{m}#{n}".to_i if (fi + fj + fk + fl + fm + fn).to_s == "#{i}#{j}#{k}#{l}#{m}#{n}"
          end
          curious_numbers << "#{i}#{j}#{k}#{l}#{m}".to_i if (fi + fj + fk + fl + fm).to_s == "#{i}#{j}#{k}#{l}#{m}"
        end
        curious_numbers << "#{i}#{j}#{k}#{l}".to_i if (fi + fj + fk + fl).to_s == "#{i}#{j}#{k}#{l}"
      end
      curious_numbers << "#{i}#{j}#{k}".to_i if (fi + fj + fk).to_s == "#{i}#{j}#{k}"
    end
    curious_numbers << "#{i}#{j}".to_i if (fi + fj).to_s == "#{i}#{j}"
  end
end

p curious_numbers.reduce(:+)
