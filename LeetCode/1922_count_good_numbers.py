# A digit string is good if the digits (0-indexed) at even indices are even and the digits at odd indices are prime (2, 3, 5, or 7).

# For example, "2582" is good because the digits (2 and 8) at even positions are even and the digits (5 and 2) at odd positions are prime. However, "3245" is not good because 3 is at an even index but is not even.
# Given an integer n, return the total number of good digit strings of length n. Since the answer may be large, return it modulo (10^9 + 7).

# A digit string is a string consisting of digits 0 through 9 that may contain leading zeros.

 

# Example 1:

# Input: n = 1
# Output: 5
# Explanation: The good numbers of length 1 are "0", "2", "4", "6", "8".
# Example 2:

# Input: n = 4
# Output: 400
# Example 3:

# Input: n = 50
# Output: 564908303
 

# Constraints:

# 1 <= n <= 10^15

def count_good_numbers(n):
    half = (n//2) % 1000000006 # digit sequence repeats every 1000000006 times
    num = pow_20(half)
    if n % 2 == 1:
        num = (num * 5) % 1000000007 
    return num

def pow_20(n):
    i = 0
    k = (673965923**(n//1000000))%1000000007 # n % 1000000006 is still really big -- these reduce it further so the loop is in the thousands rather than billions
    n = n % 1000000
    k *= (367490513**(n//10000))%1000000007
    n = n % 10000
    k *= (864605215**(n//100))%1000000007
    n = n % 100
    while i < n:
        k = (k*20) % (1000000007)
        i += 1
    return k


print(count_good_numbers(1))
print(count_good_numbers(4))
print(count_good_numbers(50))
print(count_good_numbers(100))
print(count_good_numbers(789623948667401))

# run one time to determine modulo for input number
def mod_20(n):
    i = 1
    k = 20
    while k != 1:
        i += 1
        k = (k * 20) % n
    print(i)
    print(k)

# mod_20(1000000007)