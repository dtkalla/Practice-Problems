# This is a hard version of How many are smaller than me?. If you have troubles solving this one, have a look at the easier kata first.

# Write

# function smaller(arr)
# that given an array arr, you have to return the amount of numbers that are smaller than arr[i] to the right.

# For example:

# smaller([5, 4, 3, 2, 1]) === [4, 3, 2, 1, 0]
# smaller([1, 2, 0]) === [1, 1, 0]


# this algorithm is too slow -- need faster algo
def smaller(arr):
    new_arr = []
    for i in range(len(arr)):
        count = 0
        for el in arr[i+1:]:
            if el < arr[i]:
                count += 1
        new_arr.append(count)
    return new_arr