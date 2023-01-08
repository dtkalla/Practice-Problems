# This is a hard version of How many are smaller than me?. If you have troubles solving this one, have a look at the easier kata first.

# Write

# function smaller(arr)
# that given an array arr, you have to return the amount of numbers that are smaller than arr[i] to the right.

# For example:

# smaller([5, 4, 3, 2, 1]) === [4, 3, 2, 1, 0]
# smaller([1, 2, 0]) === [1, 1, 0]



# tried to refactor from O(n^2) to O(nlogn) -- still too slow...
# is insert O(1) or O(n)?  Maybe needs linked list or something...
def smaller(arr)
    return arr if arr == []
    smaller_arr = [0]
    used_arr = [arr.pop]
    while arr.length > 0
        ele = arr.pop
        idx = binary_search(used_arr,ele)
        used_arr.insert(idx,ele)
        smaller_arr << idx
    end
    smaller_arr.reverse
end

def binary_search(arr,ele)
    if arr.length < 2
        return 1 if arr[0] && arr[0] < ele
        return 0
    end
    mid_idx = arr.length / 2
    if ele > arr[mid_idx]
        return mid_idx + 1 + binary_search(arr[(mid_idx+1)..-1],ele)
    else
        return binary_search(arr[0...mid_idx],ele)
    end
end