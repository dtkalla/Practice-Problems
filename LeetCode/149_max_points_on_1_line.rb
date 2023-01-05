# Given an array of points where points[i] = [xi, yi] represents a point on the X-Y plane, return the maximum number of points that lie on the same straight line.

 

# Example 1:


# Input: points = [[1,1],[2,2],[3,3]]
# Output: 3
# Example 2:


# Input: points = [[1,1],[3,2],[5,3],[4,1],[2,3],[1,4]]
# Output: 4
 

# Constraints:

# 1 <= points.length <= 300
# points[i].length == 2
# -104 <= xi, yi <= 104
# All the points are unique.





def max_points(points)
    return points.length if points.length < 3
    max = 2
    points.each do |p1|
        line = Hash.new(1)
        points.each do |point|
            if point == p1
                1 + 1 # not sure why I wrote this -- I think this just needs to do nothing
            elsif point[0] == p1[0] # slope is impossible to compute, but these are on the same line
                line['vertical'] += 1
            else
                m = (point[1]-p1[1])*1.0/(point[0]-p1[0]) # find slope
                line[[m]] += 1
            end
        end
        line.each {|k,v| max = v if v > max}
    end
    max
end