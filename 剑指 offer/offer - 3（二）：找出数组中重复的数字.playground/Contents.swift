//==================================================================
// 《剑指Offer——名企面试官精讲典型编程题》代码
//==================================================================
// 面试题3（二）：不修改数组找出重复的数字
// 题目：在一个长度为n+1的数组里的所有数字都在1到n的范围内，所以数组中至
// 少有一个数字是重复的。请找出数组中任意一个重复的数字，但不能修改输入的
// 数组。例如，如果输入长度为8的数组{2, 3, 5, 4, 3, 2, 6, 7}，那么对应的
// 输出是重复的数字2或者3。

import Foundation
import XCTest

class Solution {

    /**
     查找整数数组中任一重复的数字
     - Parameters:
     - nums: 整数数组
     - Returns: 重复的整数
     */
    func dunplicate(_ nums: [Int]) -> Int? {
        // 所有数字都在 1 到 nums.count -1 大小范围内, min 和 max 表示这个范围
        var min = 1
        var max = nums.count - 1
        while min <= max {
            let middle = (max - min) / 2 + min
            let countAtRange = nums.filter { $0 >= min && $0 <= middle}.count
            if min == max {
                if countAtRange > 1 {
                    return min
                } else {
                    break
                }
            }
            let expectCount = middle - min + 1
            if countAtRange > expectCount {
                max = middle
            } else {
                min = middle + 1
            }
        }
    
        return nil
    }
}

class UnitTest: XCTestCase {
    var solution: Solution!
    
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    // 数组中存在多个重复的数字
    func testCase1() {
        let nums = [2, 3, 5, 4, 3, 2, 6, 7]
        let duplications = [2, 3]
        XCTAssertTrue(duplications.contains(solution.dunplicate(nums)!))
    }
    
    // 数组中存在一个重复的数字
    func testCase2() {
        let nums = [1, 3, 4, 5, 6, 7, 2, 2]
        XCTAssertEqual(solution.dunplicate(nums)!, 2)
    }
    
//    func testCase2() {
//        let nums = [3, 2, 1, 4, 4, 5, 6, 7]
//        XCTAssertEqual(solution.duplicate(nums)!, 4)
//    }
    
    // 重复数字是数组中最小的数字
    func testCase3() {
        let nums = [1, 3, 4, 5, 6, 7, 2, 2]
        XCTAssertEqual(solution.dunplicate(nums)!, 2)
    }
    
    func testCase4() {
        let nums:[Int] = []
        XCTAssertNil(solution.dunplicate(nums))
    }
}

UnitTest.defaultTestSuite.run()

