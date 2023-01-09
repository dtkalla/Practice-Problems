require 'set'

def three_sum(nums)
    missing = Hash.new
    sums = Set[]
    nums.each {|num| missing[0-num] = true}
    (0...nums.length).each do |i|
        (0...i).each do |j|
            if missing[nums[i] + nums[j]]
                (0...j).each do |k|
                    these_nums =[nums[i], nums[j], nums[k]]
                    sums.add(these_nums.sort) if these_nums.sum == 0
                end
            end
        end
    end
    sums
end

p three_sum([-1,0,1,2,-1,-4])