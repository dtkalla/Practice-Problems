# By counting carefully it can be seen that a rectangular grid measuring 3 by 2 contains eighteen rectangles:


# Although there exists no rectangular grid that contains exactly two million rectangles, find the area of the grid with the nearest solution.



def num_rectangles(a,b)
    total = 0
    (1..a).each do |i|
        (1..b).each {|j| total += i * j}
    end
    total
end

# puts num_rectangles(1,100)


def less_than_2_million
    max = [1,1,1]
    (1..53).each do |i|
        j = 1
        k = 1
        while k < 2000000
            max = [i,j,k] if k > max[-1]
            j += 1
            k = num_rectangles(i,j)
        end
    end
    max[0]*max[1]
end

# puts less_than_2_million