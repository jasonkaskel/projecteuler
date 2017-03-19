class Node
  attr_accessor :triangle, :row, :col

  def initialize(triangle:, row:, col:)
    @triangle = triangle
    @row      = row
    @col      = col
  end

  def left
    return nil unless has_next_row?

    Node.new(
      triangle: triangle,
      row:      row+1,
      col:      col
    )
  end

  def right
    return nil unless has_next_row?

    Node.new(
      triangle: triangle,
      row:      row+1,
      col:      col+1
    )
  end

  def value
    @triangle[row][col]
  end

  private
  def has_next_row?
    (row + 1) < triangle.size
  end
end

def node_til_left_leaf(node)
  path = [node]

  while next_node = node.left
    path << next_node
    node = next_node
  end

  path
end

# From a leaf node, how many nodes should we traverse backwards
#  for the next path
def calculate_go_up(rows, paths_size)
  if paths_size % 2 == 1 # if the previous path was a "left" leaf
    1                    #  we want the "right" leaf next
  else
    # there's probably a mathier way to do this. here's what i did:
    #   mapped out for triangle's of size 2, 3, 4, 5 what the "go_up" value was for each path size
    #   (size 2, number of paths 2)  1
    #   (size 3, number of paths 4)  1 2 1
    #   (size 4, number of paths 8)  1 2 1 3 1 2 1
    #   (size 5, number of paths 16) 1 2 1 3 1 2 1 4 1 2 1 3 1 2 1
    #   (size 6, number of paths 32) 1 2 1 3 1 2 1 4 1 2 1 3 1 2 1 5 1 2 1 3 1 2 1 4 1 2 1 3 1 2 1
    # like i said, that kind of pattern has to be something mathy. for me i noticed:
    # - ignore the 1's, that's handled by paths_size % 2 == 1 and makes sense
    # - everything else followed a pattern:
    #    + regardless of triangle size, "go_up" is consistent (there's just more)
    #    + 2's were on 2, 6, 10, 14 ...
    #    + 3's were on 4, 12, 20, 28 ...
    #    + 4's were on 8, 24 ...
    #  put another way, SIZE % (2 ** x) == 2 ** (x - 1), where x is "go_up":
    #    + 6 % (2 ** 2) == 2 ** (2 - 1) === 2 % 4 == 2
    #    + 20 % (2 ** 3) == 2 ** (3 - 1) === 20 % 8 == 4
    #    + 24 % (2 ** 4) == 2 ** (4 - 1) === 24 % 16 == 8
    rows.times.map { |i| i+1 }.detect do |x| # we want x to be 1..size, not 0-based
      paths_size % (2 ** x) == 2 ** (x - 1)  # see my garbo math above
    end
  end
end

def next_path(rows:, paths:)
  go_up = calculate_go_up(rows, paths.size)

  last_path = paths.last
  next_path = last_path.slice(0, last_path.size-go_up).dup # copy the last path, up to where we want to branch
  next_path += node_til_left_leaf(next_path.last.right)    # branch and follow to it's end
end

def print_path(rows:, path:)
  path.each.with_index do |node, i|
    (rows-i).times { print '  ' }
    (node.col*2).times { print '  ' }
    puts node.value
  end
  puts ''
end

triangle = DATA.map { |row| row.split.map(&:to_i) }
max_paths = 2 ** (triangle.count - 1)

paths = [
  node_til_left_leaf(Node.new(triangle: triangle, row: 0, col: 0))
] # initialize with first "all left nodes" path
while paths.size < max_paths
  paths << next_path(rows: triangle.size, paths: paths)
end
# paths.each { |path| print_path(rows: triangle.size, path: path) }
p paths.map { |path| path.reduce(0) { |sum, node| sum += node.value }}.sort.last

__END__
              75
             95 64
            17 47 82
           18 35 87 10
          20 04 82 47 65
         19 01 23 75 03 34
        88 02 77 73 07 63 67
       99 65 04 28 06 16 70 92
      41 41 26 56 83 40 80 70 33
     41 48 72 33 47 32 37 16 94 29
    53 71 44 65 25 43 91 52 97 51 14
   70 11 33 28 77 73 17 78 39 68 17 57
  91 71 52 38 17 14 91 43 58 50 27 29 48
 63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
