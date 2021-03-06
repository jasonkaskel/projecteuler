# Triangle, square, pentagonal, hexagonal, heptagonal, and octagonal numbers
#  are all figurate (polygonal) numbers and are generated by the following
#  formulae:

# Triangle      P(3)n=n(n+1)/2     1, 3, 6, 10, 15, ...
# Square        P(4)n=n ** 2       1, 4, 9, 16, 25, ...
# Pentagonal    P(5)n=n(3n−1)/2    1, 5, 12, 22, 35, ...
# Hexagonal     P(6)n=n(2n−1)      1, 6, 15, 28, 45, ...
# Heptagonal    P(7)n=n(5n−3)/2    1, 7, 18, 34, 55, ...
# Octagonal     P(8)n=n(3n−2)      1, 8, 21, 40, 65, ...
# The ordered set of three 4-digit numbers: 8128, 2882, 8281, has three
#   interesting properties.

# The set is cyclic, in that the last two digits of each number is the first
#  two digits of the next number (including the last number with the first).
# Each polygonal type: triangle (P(3)127=8128), square (P(4)91=8281), and
#  pentagonal (P(5)44=2882), is represented by a different number in the set.
# This is the only set of 4-digit numbers with this property.
# Find the sum of the only ordered set of six cyclic 4-digit numbers for
#  which each polygonal type: triangle, square, pentagonal, hexagonal,
#  heptagonal, and octagonal, is represented by a different number
#  in the set.
# Time to complete: 45 minutes -- but dumbest way possible to solve it

@gonal_cache = { triagonal: {}, square: {}, pentagonal: {},
                 hexagonal: {}, heptagonal: {}, octagonal: {} }
(1..150).each do |num|
  @gonal_cache[:triagonal][num * (num + 1) / 2] = true
  @gonal_cache[:square][num ** 2] = true
  @gonal_cache[:pentagonal][num * (3 * num - 1) / 2] = true
  @gonal_cache[:hexagonal][num * (2 * num - 1)] = true
  @gonal_cache[:heptagonal][num * (5 * num - 3) / 2] = true
  @gonal_cache[:octagonal][num * (3 * num - 2)] = true
end

def gonal(num)
  gonals = {}

  gonals[:triagonal] = true if @gonal_cache[:triagonal][num]
  gonals[:square] = true if @gonal_cache[:square][num]
  gonals[:pentagonal] = true if @gonal_cache[:pentagonal][num]
  gonals[:hexagonal] = true if @gonal_cache[:hexagonal][num]
  gonals[:heptagonal] = true if @gonal_cache[:heptagonal][num]
  gonals[:octagonal] = true if @gonal_cache[:octagonal][num]

  gonals
end

results = []
(1000..9999).each do |num1|
  next if gonal(num1).empty?
  set = [num1]
  last_two_of_1 = num1.to_s.split(/(?=.)/).last(2).join
  ((1000..9999).to_a-set).each do |num2|
    next unless num2.to_s.match(/^#{last_two_of_1}/)
    gonals = gonal(num2)
    next if gonals.empty? || gonals.merge(gonal(num1)).keys.size < 2
    set = [num1, num2]
    last_two_of_2 = num2.to_s.split(/(?=.)/).last(2).join
    ((1000..9999).to_a-set).each do |num3|
      next unless num3.to_s.match(/^#{last_two_of_2}/)
      gonals = gonal(num3)
      next if gonals.empty? || gonals.merge(gonal(num1)).merge(gonal(num2)).keys.size < 3
      set = [num1, num2, num3]
      last_two_of_3 = num3.to_s.split(/(?=.)/).last(2).join
      ((1000..9999).to_a-set).each do |num4|
        next unless num4.to_s.match(/^#{last_two_of_3}/)
        gonals = gonal(num4)
        next if gonals.empty? || gonals.merge(gonal(num1)).merge(gonal(num2)).merge(gonal(num3)).keys.size < 4
        set = [num1, num2, num3, num4]
        last_two_of_4 = num4.to_s.split(/(?=.)/).last(2).join
        ((1000..9999).to_a-set).each do |num5|
          next unless num5.to_s.match(/^#{last_two_of_4}/)
          gonals = gonal(num5)
          next if gonals.empty? || gonals.merge(gonal(num1)).merge(gonal(num2)).merge(gonal(num3)).merge(gonal(num4)).keys.size < 5
          set = [num1, num2, num3, num4, num5]
          last_two_of_5 = num5.to_s.split(/(?=.)/).last(2).join
          ((1000..9999).to_a-set).each do |num6|
            next unless num6.to_s.match(/^#{last_two_of_5}/)
            last_two_of_6 = num6.to_s.split(/(?=.)/).last(2).join
            next unless num1.to_s.match(/^#{last_two_of_6}/)
            gonals = gonal(num6)
            next if gonals.empty? || gonals.merge(gonal(num1)).merge(gonal(num2)).merge(gonal(num3)).merge(gonal(num4)).merge(gonal(num5)).keys.size < 6
            set = [num1, num2, num3, num4, num5, num6]

            results << set
          end
        end
      end
    end
  end
end

results.map do |result|
  p result
  result.map do |n|
    p "  #{n}"
    p "  #{gonal(n)}"
  end
  p result.reduce(:+)
  p '***'
end
