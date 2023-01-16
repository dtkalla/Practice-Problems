# Given an integer n, return the number of ways you can write n as the sum of consecutive positive integers.

 

# Example 1:

# Input: n = 5
# Output: 2
# Explanation: 5 = 2 + 3
# Example 2:

# Input: n = 9
# Output: 3
# Explanation: 9 = 4 + 5 = 2 + 3 + 4
# Example 3:

# Input: n = 15
# Output: 4
# Explanation: 15 = 8 + 7 = 4 + 5 + 6 = 1 + 2 + 3 + 4 + 5
 

# Constraints:

# 1 <= n <= 10^9


def consecutive_numbers_sum(n):
    total = 0
    i = 1
    while i**2 <= 2*n: # can be written as the sum of an odd-numbered sequence
        if n % i == 0:
            total += 1 
        i += 2
    i = 2
    while i**2 <= 2*n: # can be written as the sum of an even-numbered sequence
        if (n + i/2) % i == 0:
            total += 1 
        i += 2
    return total
