import time
from typing import List
import timeit


class Solution:
    def isPalindrome(self, x: int) -> bool:
        strx = str(x)
        wordlength = len(strx)
        for pos in range(round(wordlength / 2)):
            if strx[pos] != strx[wordlength - pos - 1]:
                return False
        return True


solve = Solution()
print(solve.isPalindrome(1234))