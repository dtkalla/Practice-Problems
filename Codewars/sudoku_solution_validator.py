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
    first_box = board[0][0:3] + board[1][0:3] + board [2][0:3] #fix to check other boxes
    for i in range(9):
        if not group[i] in first_box:
            return False
    return True