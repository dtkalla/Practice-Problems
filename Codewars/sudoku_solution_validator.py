def valid_solution(board):
    group = [1,2,3,4,5,6,7,8,9]
    for i in range(9): #check each row
        for j in range(9):
            if not group[i] in board[j]:
                return False
    for i in range(9): #check each column
        column = []
        for j in range(9):
            column.append(board[j][i])
        for j in range(9):
            if not group[j] in column:
                return False
    a = 0
    b = 0
    for i in range(9): # first loop checks first box
        box = board[a][b:b+3] + board[a+1][b:b+3] + board [a+2][b:b+3]
        for i in range(9):
            if not group[i] in box:
                return False
        a += 3 # increment a / b to check other boxes
        if a == 9:
            a = 0
            b += 3

    return True # all checks pass!