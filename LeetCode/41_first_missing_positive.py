class Solution(object):
    def firstMissingPositive(self, nums):
        nums = set(nums)
        i = 1
        while True:
            if i in nums:
                i += 1
            else:
                return i