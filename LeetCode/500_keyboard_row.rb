# Given an array of strings words, return the words that can be typed using letters of the alphabet on only one row of American keyboard like the image below.

# In the American keyboard:

# the first row consists of the characters "qwertyuiop",
# the second row consists of the characters "asdfghjkl", and
# the third row consists of the characters "zxcvbnm".

 

# Example 1:

# Input: words = ["Hello","Alaska","Dad","Peace"]
# Output: ["Alaska","Dad"]
# Example 2:

# Input: words = ["omk"]
# Output: []
# Example 3:

# Input: words = ["adsdf","sfd"]
# Output: ["adsdf","sfd"]
 

# Constraints:

# 1 <= words.length <= 20
# 1 <= words[i].length <= 100
# words[i] consists of English letters (both lowercase and uppercase). 




# I never code like this in general -- it's hard to read and modify -- but I did a one-line solution in this problem for fun.
def find_words(words)   
    words.select {|word| ['qwertyuiop','asdfghjkl','zxcvbnm'].any? {|row| word.downcase.split('').all? {|char| row.split('').include?(char)}}}
end