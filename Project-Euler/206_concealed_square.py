# Find the unique positive integer whose square has the form 1_2_3_4_5_6_7_8_9_0,
# where each “_” is a single digit.




def find_big_square():
    i = 1000000030 # last digit must be 0, penultimate digit must be 3 or 7
    while not valid(i):
        i += 40
        if valid(i):
            return i
        i += 60
        # print(i**2)
        if str(i**2)[2] != '1' and str(i**2)[2] != '2':
            i += 10000000 # narrowing down the range of possbilities, speeding up the algorithm
    return i

def valid(n):
    n = str(n**2)
    return n[2] == '2' and n[4] == '3' and n[6] == '4' and n[8] == '5' and n[10] == '6' and n[12] == '7' and n[14] == '8'
    

print(find_big_square())