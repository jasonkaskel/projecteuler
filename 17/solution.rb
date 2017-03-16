# If the numbers 1 to 5 are written out in words:
#  one, two, three, four, five
#  then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

# If all the numbers from 1 to 1000 (one thousand) inclusive
#  were written out in words, how many letters would be used?
# NOTE: Do not count spaces or hyphens.
#   For example, 342 (three hundred and forty-two) contains 23
#   letters and 115 (one hundred and fifteen) contains 20 letters.
#   The use of "and" when writing out numbers is in compliance
#   with British usage.
# Time to complete: 20 minutes

MAP = {
  1 => 'one',
  2 => 'two',
  3 => 'three',
  4 => 'four',
  5 => 'five',
  6 => 'six',
  7 => 'seven',
  8 => 'eight',
  9 => 'nine',
  10 => 'ten',
  11 => 'eleven',
  12 => 'twelve',
  13 => 'thirteen',
  14 => 'fourteen',
  15 => 'fifteen',
  16 => 'sixteen',
  17 => 'seventeen',
  18 => 'eighteen',
  19 => 'nineteen',
  20 => 'twenty',
  30 => 'thirty',
  40 => 'forty',
  50 => 'fifty',
  60 => 'sixty',
  70 => 'seventy',
  80 => 'eighty',
  90 => 'ninety',
  1000 => 'onethousand'
}

def letters_for_number(number)
  return 0 if number == 0
  return MAP[number].size if MAP[number]

  if number < 100
    remainder = number.to_s.split(/(?=.)/).last.to_i
    decile = number - remainder
    letters_for_number(decile) + letters_for_number(remainder)
  else
    hundreds = number.to_s.split(/(?=.)/).first.to_i
    remainder = number - (hundreds * 100)
    letters_for_number(hundreds) + 'hundred'.size +
      (remainder > 0 ? 'and'.size : 0) +
      letters_for_number(remainder)
  end
end

max_number = 1000
p (1..max_number).reduce(0) { |sum, i| sum + letters_for_number(i) }
