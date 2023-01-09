# Practice Problems

Other than actual projects, I mostly practice coding with three sites: Codewars, Project Euler, and LeetCode.  This repository includes a selection of problems I enjoyed from different sites.  I generally prefer coding in Ruby, but I like to code in Python periodically as well and keep my skills sharp, so both are used here.

Each problem has the prompt at the top and my work below.  All of the problems were fun and challenging, and they all show my coding style fairly well.

Battleship Field Validator shows my Ruby style particularly well -- I use lots of helper functions and often think in terms of numbers instead of objects:

```
def validate_battlefield(field)
    battleship_count = count_4(field) + count_4(field.transpose)
    cruiser_count = count_3(field) + count_3(field.transpose)
    destroyer_count = count_2(field) + count_2(field.transpose)
    submarine_count = count_1(field)
    return false unless battleship_count == 1
    return false unless cruiser_count == 4
    return false unless destroyer_count == 10
    return false unless submarine_count == 20
    no_diagonals?(field)
end
```
Note that there are only two cruisers, but my code will count 4 sequences of three spaces occupied by a ship -- the battleship will be counted as two cruisers.

I especially like LeetCode problem 41 as well, because it's so elegant with the Set class in Python:
```
class Solution(object):
    def firstMissingPositive(self, nums):
        nums = set(nums)
        i = 1
        while True:
            if i in nums:
                i += 1
            else:
                return i
```

### Coding Stats

Top 2.5% on Codewars, top 5% on Project Euler

![Daniel's Codewars stats -- 3 kyu, 1520 honor, top 2.5%](https://github.r2v.ch/codewars?user=dkalla&top_languages=true)

![Project Euler -- top 5%](https://projecteuler.net/profile/dkalla.png)

[![Daniel's LeetCode stats](https://leetcode-stats-six.vercel.app/api?username=dtkalla)](https://github.com/madushadhanushka/github-readme)
