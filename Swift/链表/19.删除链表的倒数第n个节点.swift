/**
 * Question Link: https://leetcode.com/problems/remove-nth-node-from-end-of-list/
 * Primary idea: Runner Tech
 * Time Complexity: O(n), Space Complexity: O(1)
 * 思路: 通过双指针, 第一个指针移动 n + 1 步, 两个指针被 n 个结点分开, 保持恒定的距离
        直到第一个节点指针到达最后一个节点, 此时将第二个指针引用的结点 next 指向该结点的 下下个指针
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var prev : ListNode? = head
        var post : ListNode? = head
        
        for _ in 0..<n {
            post = post!.next
        }
        
        while post!.next != nil {
            prev = prev!.next
            post = post!.next
        }
        
        prev!.next = prev!.next!.next
        
        return dummy.next
    }
}
