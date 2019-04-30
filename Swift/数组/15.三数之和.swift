/**
 * Question Link: https://leetcode.com/problems/3sum/
 * Primary idea: Sort the array, and traverse it, increment left or decrease right
 *               predicated on their sum is greater or not than the target
 * Time Complexity: O(n^2), Space Complexity: O(nC3) 双指针
 * 1.将数组排序
 2.定义三个指针，i，j，k。遍历i，
 那么这个问题就可以转化为在i之后的数组中寻找nums[j]+nums[k]=-nums[i]这个问题，也就将三数之和问题转变为二数之和---（可以使用双指针）
 */

class ThreeSum {
    func threeSum(nums:[Int]) -> [[Int]] {
        var nums = nums.sorted(by: <)
        var res = [[Int]]()
        
        if nums.count <= 2 {
            return res
        }
        
        for i in 0...nums.count - 3 {
            if i == 0 || nums[i] != nums[i -1] {
                var remain = -nums[i]
                var left = i + 1
                var right = nums.count - 1
                while left < right {
                    if nums[left] + nums[right] == remain {
                        var temp = [Int]()
                        temp.append(nums[i])
                        temp.append(nums[left])
                        temp.append(nums[right])
                        
                        res.append(temp)
                        repeat {
                            left += 1
                        } while (left < right && nums[left] == nums[left - 1])
                        repeat {
                            right -= 1
                        } while (left < right && nums[right] == nums[right + 1])
                    } else if (nums[left] + nums[right] < remain) {
                        repeat {
                            left += 1
                        } while (left < right && nums[left] == nums[left -1])
                    } else {
                        repeat {
                            right -= 1
                        } while (left < right && nums[right] == nums[right + 1])
                    }
                }
            }
        }
        return res
    }
}
