# The fraction 49/98 is a curious fraction, as an inexperienced mathematician in
#  attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is
#  correct, is obtained by cancelling the 9s.
#
# We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
#
# There are exactly four non-trivial examples of this type of fraction, less than one
#  in value, and containing two digits in the numerator and denominator.
#
# If the product of these four fractions is given in its lowest common terms, find
#  the value of the denominator.
# Time to complete: 15 minutes

curious_fractions = []

(10..99).each do |numerator|
  (10..99).each do |denominator|
    next unless numerator.to_f / denominator < 1
    next if numerator % 10 == 0 && denominator % 10 == 0
    next if numerator % 11 == 0 && denominator % 11 == 0

    num_as_ary = numerator.to_s.split(/(?=.)/).map(&:to_i)
    den_as_ary = denominator.to_s.split(/(?=.)/).map(&:to_i)

    if (
         den_as_ary[1] != 0 &&
         num_as_ary[0].to_f / den_as_ary[1] == numerator.to_f / denominator &&
         num_as_ary[1] == den_as_ary[0]
       ) ||
       (
         den_as_ary[0] != 0 &&
         num_as_ary[1].to_f / den_as_ary[0] == numerator.to_f / denominator &&
         num_as_ary[0] == den_as_ary[1]
       )
       curious_fractions << [numerator, denominator]
    end
  end
end

curious_numerators = curious_fractions.map { |fraction| fraction.first }
curious_denominators = curious_fractions.map { |fracation| fracation.last }

require_relative '../lib/util'
p Util.product(curious_denominators) / Util.product(curious_numerators)
