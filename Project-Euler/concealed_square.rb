# Find the unique positive integer whose square has the form 1_2_3_4_5_6_7_8_9_0,
# where each “_” is a single digit.




def find_big_square
    i = 1000000030 # last digit must be 0, penultimate digit must be 3 or 7
    until is_valid?(i)
        i += 40
        return i if is_valid?(i)
        i += 60
        p i**2
        i +=10000000 unless ['1','2'].include?((i**2).to_s[2]) # narrowing down the range of possbilities, speeding up the algorithm
    end
    i
end

def is_valid?(n)
    n = (n**2).to_s
    return false unless n[2] == '2'
    return false unless n[4] == '3'
    return false unless n[6] == '4'
    return false unless n[8] == '5'
    return false unless n[10] == '6'
    return false unless n[12] == '7'
    return false unless n[14] == '8'
    true
end

p find_big_square