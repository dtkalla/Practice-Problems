# Given a Sudoku data structure with size NxN, N > 0 and √N == integer, write a method to validate if it has been filled out correctly.

# The data structure is a multi-dimensional Array, i.e:

# [
#   [7,8,4,  1,5,9,  3,2,6],
#   [5,3,9,  6,7,2,  8,4,1],
#   [6,1,2,  4,3,8,  7,5,9],
  
#   [9,2,8,  7,1,5,  4,6,3],
#   [3,5,7,  8,4,6,  1,9,2],
#   [4,6,1,  9,2,3,  5,8,7],
  
#   [8,7,6,  3,9,4,  2,1,5],
#   [2,4,3,  5,6,1,  9,7,8],
#   [1,9,5,  2,8,7,  6,3,4]
# ]
# Rules for validation

# Data structure dimension: NxN where N > 0 and √N == integer
# Rows may only contain integers: 1..N (N included)
# Columns may only contain integers: 1..N (N included)
# 'Little squares' (3x3 in example above) may also only contain integers: 1..N (N included)




class Sudoku(object):
    def __init__(self, data):
        self.data = data
    def is_valid(self):
        board = self.data
        N = len(board)
        if str(board[0][0]) == 'True': # previous equations count True as 1
            return False
        group = []
        for i in range(1,N+1):
            group.append(i)
        for i in range(N): #check each row
            for j in range(N):
                if not group[i] in board[j]:
                    return False
        for i in range(N): #check each column
            column = []
            for j in range(N):
                column.append(board[j][i])
            for j in range(N):
                if not group[j] in column:
                    return False
        a = 0
        b = 0
        n = int(N**0.5)
        for i in range(N): # first loop checks first box
            box = []
            for i in range(n):
                box += board[a+i][b:b+n]
            for i in range(N):
                if not group[i] in box:
                    return False
            a += n # increment a / b to check other boxes
            if a == N:
                a = 0
                b += n
        return True # all checks pass!