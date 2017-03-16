# Starting in the top left corner of a 2×2 grid,
#   and only being able to move to the right and
#   down, there are exactly 6 routes to the bottom right corner.
# How many such routes are there through a 20×20 grid?
# Time to complete: 60 minutes

require_relative '../lib/util'

grid_dimensions = 20
grid = (1..grid_dimensions+1).each_with_object([]) do |col, grid|
  if col == 1
    grid << [1]
  elsif col == 2
    grid << Array.new(grid_dimensions, 1)
  else
    last = grid.last
    grid << (1..grid_dimensions).each_with_object([]) do |row, array|
      array << Util.sum(last.drop(row-1))
    end
  end
end
p Util.sum(grid.flatten)
