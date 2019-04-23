/**
 * Question Link: https://leetcode.com/problems/container-with-most-water/
 * Primary idea: First given largest width, then go to height-increase direction while width decreases
 * Time Complexity: O(n), Space Complexity: O(1)
 * 通过双指针的方式
 */

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var maxArea = 0
        var left = 0
        var right = height.count - 1
        
        white (left < right) {
            
            let minHeight = min(height[left], height[right])
            
            maxArea = max(maxArea, (right - left) * minHeight)
            
            if minHeight == left {
                left += 1
            } else {
                right -= 1
            }
        }
        return maxArea
    }
}
