# If p is the perimeter of a right angle triangle with integral length sides,
#  {a,b,c}, there are exactly three solutions for p = 120.

# {20,48,52}, {24,45,51}, {30,40,50}

# For which value of p ≤ 1000, is the number of solutions maximised?
# Time to complete: 30 minutes

MAX_P = 1_000

ps = Hash.new([])
(3..MAX_P).each do |pee|
  (1..pee).each do |a|
    (1..pee - a).each do |b|
      c = pee - a - b

      if a * a + b * b == c * c
        ps[pee] += [[a, b, c].sort]
      end
    end
  end
end

p ps.sort_by { |_, v| v.uniq.size }.reverse.first.first
