/**
 * Question Link: https://leetcode.com/problems/merge-two-sorted-lists/
 * Primary idea: Dummy Node to traverse two lists, compare two nodes and point to the right one
 * Time Complexity: O(n), Space Complexity: O(1)
 * 思路: 分治与递归算法 (有异常)
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

class MergeTwoSortedLists {
    func mergeTwoSortedLists (_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var node = dummy
        var l1 = l1
        var l2 = l2
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                node.next = l1
                l1 = l1!.next
            } else {
                node.next = l2
                l2 = l2!.next
            }
            node = node.next!
        }
        node.next = l1 ?? l2
        return dummy.next

// 通过分治与递归算法, 能解决部分问题, 但是存在边际条件导致数据异常
//        if l1 != nil && l2 != nil {
//            var node : ListNode?
//            if l1!.var <= l2!.val {
//                node = ListNode(l1!.val)
//                l1 = l1!.next
//            } else {
//                node = ListNode(l2!.val)
//                l2 = l2!.next
//            }
//            return node
//        }
//        return l1 ?? l2
    }
}
