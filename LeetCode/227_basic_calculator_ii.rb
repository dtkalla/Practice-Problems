# Given a string s which represents an expression, evaluate this expression and return its value. 

# The integer division should truncate toward zero.

# You may assume that the given expression is always valid. All intermediate results will be in the range of [-231, 231 - 1].

# Note: You are not allowed to use any built-in function which evaluates strings as mathematical expressions, such as eval().

 

# Example 1:

# Input: s = "3+2*2"
# Output: 7
# Example 2:

# Input: s = " 3/2 "
# Output: 1
# Example 3:

# Input: s = " 3+5 / 2 "
# Output: 5
 

# Constraints:

# 1 <= s.length <= 3 * 105
# s consists of integers and operators ('+', '-', '*', '/') separated by some number of spaces.
# s represents a valid expression.
# All the integers in the expression are non-negative integers in the range [0, 231 - 1].
# The answer is guaranteed to fit in a 32-bit integer.



def calculate(s)
    s = s.delete(' ')
    return s.to_i if s.split('').all? {|char| '1234567890'.split('').include?(char)}
    add = s.split('+') # reverse order of operations: ASMD
    if add.length > 1
        add = add.map {|ele| calculate(ele)}
        return add.sum
    end
    sub = s.split('-')
    if sub.length > 1
        sub = sub.map {|ele| calculate(ele)}
        while sub.length > 1
            new = sub.shift
            sub[0] = new - sub[0]
        end
        return sub[0]
    end
    mult = s.split('*')
    if mult.length > 1
        mult = mult.map {|ele| calculate2(ele)} # The / operator is different from real division, which creates certain problems with multiplcation.  (This would actually be much easier with real division!)  Calculate2 keeps the decimal part in case I mutiply it with something.
        product = 1
        mult.each {|ele| product = (product * ele).to_i} # Once I'm done multiplying, I want things as whole numbers again
        return product.to_i
    end
    div = s.split('/')
    if div.length > 1
        div = div.map {|ele| calculate(ele)}
        while div.length > 1
            new = div.shift
            div[0] = new / div[0]
        end
        return div[0]
    end
    0
end

def calculate2(s)
    s = s.delete(' ')
    return s.to_i if s.split('').all? {|char| '1234567890'.split('').include?(char)}
    div = s.split('/')
    if div.length > 1
        div = div.map {|ele| calculate(ele)}
        while div.length > 1
            new = div.shift * 1.0
            div[0] = new / div[0]
        end
        return div[0]
    end
end


p calculate("3+2*2") #7
p calculate(" 3/2 ") #1
p calculate(" 3+5 / 2 ") #5
p calculate("1+2*5/3+6/4*2") #6