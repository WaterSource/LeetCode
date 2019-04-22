/**
 * Question Link: https://leetcode.com/problems/two-sum/
 * Primary idea: Traverse the array and store target - nums[i] in a dict
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        
        for (i, num) in nums.enumerated() {
            if let index = dict[target - num] {
                return [index, i]
            }
            dict[num] = i
        }
        
        fatalError("No valid outputs")
    }
}
