# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def addTwoNumbers(self, l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:
        numOne = []
        numTwo = []
        while l1.next:
            numOne += [str(l1.next)] + numOne
        while l2.next:
            numTwo += [str(l2.next)] + numTwo
        numsOne = numOne.join()
        intsOne = int(numsOne)
        numsTwo = numTwo.join()
        intsTwo= int(numsTwo)
        return intsOne+intsTwo