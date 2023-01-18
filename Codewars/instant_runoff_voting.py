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



#very much not yet rewritten in python...
def runoff(voters):
    majority = voters.length//2 + 1
    until voters_empty?(voters)
        counts = Hash.new(0)
        voters.each {|voter| counts[voter[0]] += 1}
        max = 0
        max_candidate = voters[0][0]
        min = majority
        counts.each do |k,v|
            min = v if v < min
            max,max_candidate = v,k if v > max
        return max_candidate if max >= majority
        mins = []
        voters.each do |voter|
            mins << voter[0] if counts[voter[0]] == min and not mins.include?(voter[0])
        voters[0].each do |vote|
            mins = [vote] if counts[vote] == 0
        voters.each do |voter|
            mins.each do |min_c|
                voter.delete(min_c)
    return None

def voters_empty?(voters)
  voters.all? {|voter| voter.empty?}
end