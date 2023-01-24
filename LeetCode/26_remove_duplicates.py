def three_sum(nums):
    missing = {}
    sums = []
    for num in nums:
        missing[0-num] = True
    for i in range(len(nums)):
        for j in range(i):
            if (nums[i] + nums[j]) in missing:
                for k in range(j):
                    these_nums = [nums[i],nums[j],nums[k]]
                    these_nums.sort()
                    if sum(these_nums) == 0:
                        if these_nums not in sums: sums.append(these_nums)
    return sums

print(three_sum([-1,0,1,2,-1,-4]))