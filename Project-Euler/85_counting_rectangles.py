# By counting carefully it can be seen that a rectangular grid measuring 3 by 2 contains eighteen rectangles:


# Although there exists no rectangular grid that contains exactly two million rectangles, find the area of the grid with the nearest solution.



def num_rectangles(a,b):
    total = 0
    for i in range(1,a+1):
        for j in range(1,b+1):
            total += i * j
    return total


print(num_rectangles(1,100))


def less_than_2_million():
    max = [1,1,1]
    for i in range(1,54):
        j = 1
        k = 1
        while k < 2000000:
            if k > max[-1]:
                max = [i,j,k] 
            j += 1
            k = num_rectangles(i,j)
    return max[0] * max[1]

print(less_than_2_million())