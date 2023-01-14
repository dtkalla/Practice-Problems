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




def find_median_sorted_arrays(nums1, nums2):
    nums = []
    while len(nums1) * len(nums2) > 0: # based on merge sort
        if nums1[-1] > nums2[-1]:
            nums.append(nums1.pop()) # can't remember if shift is O(1) or O(n), so using pop instead
        else:
            nums.append(nums2.pop())
    nums.reverse()
    nums = nums1 + nums2 + nums # needs to reverse because I used pop
    l = len(nums)
    if l % 2 == 0:
        return (nums[l/2] + nums[l/2-1])/2
    else:
        return nums[l//2]
 

print(find_median_sorted_arrays([0,3,4,5,7],[1,9,10,12]))