require 'set'


# probably not an optimal solution -- it's still O(n^3), but improved from my old O(n^3) soliution to work better with lots of duplicates
# might be possible to reduce ot O(n^2) by doing pairs of elements as keys in hash?  Pretty terrible on space, though...
def four_sum(nums, target)
    quads = Set[] # no repeats
    new_nums = []
    count = Hash.new(0)
    nums.each do |num|
        new_nums << num if count[num] < 4 # max of three times per number
        count[num] += 1
    end
    nums = new_nums
    len = nums.length
    (0...len).each do |i|
        (0...i).each do |j|
            (0...j).each do |k|
                these_nums = [nums[i],nums[j],nums[k]]
                goal = target-these_nums.sum
                if count[goal]
                    these_count = 0
                    these_nums.each {|num| these_count += 1 if num == goal}
                    if count[goal] > these_count # if number still in array
                        quad = these_nums.append(goal).sort
                        quads.add(quad) if quad.sum == target
                    end
                end
            end
        end
    end
    quads.to_a
end

p four_sum([1,0,-1,0,-2,2],0)
p four_sum([2,2,2,2,2],8)
p four_sum([-489,-487,-471,-464,-451,-421,-414,-405,-396,-355,-354,-350,-336,-335,-334,-307,-298,-296,-295,-287,-267,-256,-247,-231,-170,-130,-120,-109,-96,-80,-78,-71,-63,-56,-44,-43,-13,2,9,18,31,36,39,43,49,49,50,61,68,73,99,107,112,113,120,121,173,180,185,190,203,210,233,246,258,296,319,340,345,370,371,378,395,418,436,444,447,451,460,485],2926)