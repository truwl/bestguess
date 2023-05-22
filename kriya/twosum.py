import time
from typing import List
import timeit

class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        lookup = {nums[x]:x for x in range(0,len(nums))}
        for n1 in range(0,len(nums)):
            if target-nums[n1] in lookup and n1 != lookup[target-nums[n1]]:
                return([n1,lookup[target-nums[n1]]])

    def twoSumBest(self, nums: List[int], target: int) -> List[int]:
        d = {}
        for i, n in enumerate(nums):
            m = target - n
            if m in d:
                return [d[m], i]
            else:
                d[n] = i

solve = Solution()
print(time.time("solve.twoSum([3,2,4],6)"))
print(solve.twoSumBest([3,2,4],6))