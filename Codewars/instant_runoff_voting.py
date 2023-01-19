# DESCRIPTION:
# Your task is to implement a function that calculates an election winner from a list of voter selections using an Instant Runoff Voting algorithm. If you haven't heard of IRV, here's a basic overview (slightly altered for this kata):

# Each voter selects several candidates in order of preference.
# The votes are tallied from the each voter's first choice.
# If the first-place candidate has more than half the total votes, they win.
# Otherwise, find the candidate who got the least votes and remove them from each person's voting list.
# In case of a tie for least, remove all of the tying candidates.
# In case of a complete tie between every candidate, return nil(Ruby)/None(Python)/undefined(JS).
# Start over.
# Continue until somebody has more than half the votes; they are the winner.
# Your function will be given a list of voter ballots; each ballot will be a list of candidates (symbols) in descending order of preference. You should return the symbol corresponding to the winning candidate. See the default test for an example!



def runoff(voters):
    majority = len(voters)//2 + 1
    while not voters_empty(voters):
        counts = {}
        for voter in voters:
            if voter[0] in counts:
                counts[voter[0]] += 1
            else:
                counts[voter[0]] = 1
        max = 0
        max_candidate = voters[0][0]
        min = majority
        for key in counts:
            if counts[key] < min:
                min = counts[key]
            if counts[key] > max:
                max,max_candidate = counts[key],key 
        if max >= majority:
            return max_candidate 
        mins = []
        for voter in voters:
            if counts[voter[0]] == min and voter[0] not in mins:
                mins.append(voter[0]) 
        for vote in voters[0]:
            if vote not in counts:
                mins = [vote]
        for voter in voters:
            for min_c in mins:
                voter.remove(min_c)
    return None

def voters_empty(voters):
    for voter in voters:
        if len(voter) > 0:
            return False
    return True