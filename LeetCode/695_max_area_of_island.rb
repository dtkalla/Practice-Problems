# You are given an m x n binary matrix grid. An island is a group of 1's (representing land) connected 4-directionally (horizontal or vertical.) You may assume all four edges of the grid are surrounded by water.

# The area of an island is the number of cells with a value 1 in the island.

# Return the maximum area of an island in grid. If there is no island, return 0.

 

# Example 1:


# Input: grid = [[0,0,1,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,1,1,0,1,0,0,0,0,0,0,0,0],[0,1,0,0,1,1,0,0,1,0,1,0,0],[0,1,0,0,1,1,0,0,1,1,1,0,0],[0,0,0,0,0,0,0,0,0,0,1,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,0,1,1,0,0,0,0]]
# Output: 6
# Explanation: The answer is not 11, because the island must be connected 4-directionally.
# Example 2:

# Input: grid = [[0,0,0,0,0,0,0,0]]
# Output: 0
 

# Constraints:

# m == grid.length
# n == grid[i].length
# 1 <= m, n <= 50
# grid[i][j] is either 0 or 1

require 'set'

def max_area_of_island(grid)
    max = 0
    checked = Set[] # check each element of grid exactly once
    dirs = [[0,1],[0,-1],[-1,0],[1,0]] # no diagonals
    m = grid.length
    n = grid[0].length
    (0...m).each do |i|
        (0...n).each do |j|
            if grid[i][j] != 0 && !checked.include?([i,j]) # unchecked island
                queue = [[i,j]]
                total = 0
                until queue.empty? # until entire island has been searched
                    ele = queue.shift
                    total += 1
                    checked.add(ele)
                    dirs.each do |dir|
                        a,b = ele[0] + dir[0], ele[1] + dir[1]
                        if valid?(m,n,a,b) && grid[a][b] != 0 && !checked.include?([a,b]) # on the grid & part of the island & not checked yet
                             # 6 layers deep, ooof!  There are a few ways I could reduce layering, but I'm not sure it would actually be more readable...
                            queue << [a,b]
                            checked.add([a,b])
                        end
                    end
                end
                max = total if total > max
            end
        end
    end
    max
end


def valid?(m,n,a,b)
    (0...m).cover?(a) && (0...n).cover?(b) # cover? is faster than include?
end


p max_area_of_island([[1,1,0,0,0],[1,1,0,0,0],[0,0,0,1,1],[0,0,0,1,1]])