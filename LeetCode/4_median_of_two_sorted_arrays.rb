# Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.

# The overall run time complexity should be O(log (m+n)).

 

# Example 1:

# Input: nums1 = [1,3], nums2 = [2]
# Output: 2.00000
# Explanation: merged array = [1,2,3] and median is 2.
# Example 2:

# Input: nums1 = [1,2], nums2 = [3,4]
# Output: 2.50000
# Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.
 

# Constraints:

# nums1.length == m
# nums2.length == n
# 0 <= m <= 1000
# 0 <= n <= 1000
# 1 <= m + n <= 2000
# -106 <= nums1[i], nums2[i] <= 106




def find_median_sorted_arrays(nums1, nums2)
    nums = []
    while nums1.length > 0 && nums2.length > 0 # based on merge sort
        if nums1[-1] > nums2[-1]
            nums << nums1.pop # can't remember if shift is O(1) or O(n), so using pop instead
        else
            nums << nums2.pop
        end
    end
    nums = nums1 + nums2 + nums.reverse # needs to reverse because I used pop
    len = nums.length
    if len % 2 == 0
        (nums[len/2] + nums[len/2-1])/2.0
    else
        nums[len/2]
    end
end