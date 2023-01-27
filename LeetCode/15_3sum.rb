# Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

# Notice that the solution set must not contain duplicate triplets.

 

# Example 1:

# Input: nums = [-1,0,1,2,-1,-4]
# Output: [[-1,-1,2],[-1,0,1]]
# Explanation: 
# nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
# nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
# nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
# The distinct triplets are [-1,0,1] and [-1,-1,2].
# Notice that the order of the output and the order of the triplets does not matter.
# Example 2:

# Input: nums = [0,1,1]
# Output: []
# Explanation: The only possible triplet does not sum up to 0.
# Example 3:

# Input: nums = [0,0,0]
# Output: [[0,0,0]]
# Explanation: The only possible triplet sums up to 0.
 

# Constraints:

# 3 <= nums.length <= 3000
# -10^5 <= nums[i] <= 10^5


require 'set'

def three_sum(nums)
    pos = []
    zero = []
    neg = []
    nums.each do |num|
        if num == 0
            zero << num
        elsif num < 0
            neg << num
        else
            pos << num
        end
    end
    positives = Set[]
    negatives = Set[]
    pos.each {|po| positives.add(po)}
    neg.each {|ne| negatives.add(ne)}
    trips = []
    trips << [0,0,0] if zero.length > 2
    if zero.length > 0
        negatives.each do |n|
            trips << [n, 0, -1 * n] if positives.include?(-1*n)
        end
    end
    (1...neg.length).each do |i|
        (0...i).each do |j|
            sum = neg[i] + neg[j]
            trips << [neg[i],neg[j],-1*sum].sort if positives.include?(-1*sum)
        end
    end
    (1...pos.length).each do |i|
        (0...i).each do |j|
            sum = pos[i] + pos[j]
            trips << [pos[i],pos[j],-1*sum].sort if negatives.include?(-1*sum)
        end
    end
    trips.uniq.sort
end