# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
# a*a + b*b = c*c
# For example, 3*3 + 4*4 = 9 + 16 = 25 = 5*5.
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.
# Time to complete: 10 minutes

require_relative '../lib/util'

def py_trip?(a, b, c)
  a * a + b * b == c * c
end

def py_trip_eql(goal)
  a = 1
  b = nil
  c = nil
  while a < goal - 2
    b = a + 1
    while b < goal - 2
      c = b + 1
      while c < goal - 2
        return [a, b, c] if a + b + c == goal && py_trip?(a, b, c)
        c += 1
      end
      b += 1
    end
    a += 1
  end

  nil
end

goal = 1000
result = py_trip_eql(goal)
p Util.product(result)
