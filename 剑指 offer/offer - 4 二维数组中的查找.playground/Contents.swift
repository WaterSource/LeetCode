//==================================================================
// 《剑指Offer——名企面试官精讲典型编程题》代码
//==================================================================
// 面试题4：二维数组中的查找
// 题目：在一个二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按
// 照从上到下递增的顺序排序。请完成一个函数，输入这样的一个二维数组和一个
// 整数，判断数组中是否含有该整数。


import Foundation
import XCTest

class Solution {
    /**
     判断二维数组中是否含有该整数P
     从二维数组的右上角开始查找
     - Parameters:
     - matrix: 二维数组
     - num: 查找的整数
     - Returns: 是否包含
     */
    func find(_ matrix: [[Int]], num: Int) -> Bool {
        // y 表示二维数组的列数, x 表示二维数组的行数, 索引均从 0 开始
        // 查找方法从二维数组的右上角比较
        var y = 0
        var x = matrix.count - 1
        
        while y <= matrix.count - 1 && x >= 0 {
            if matrix[y][x] > num {
                x -= 1
            } else if matrix[y][x] < num {
                y += 1
            } else {
                return true
            }
        }
        return false
    }
}

class UnitTests: XCTestCase {
    var solutuon: Solution!
    override func setUp() {
        super.setUp()
        solutuon = Solution()
    }
    
    // 查找的数存在数组中
    func testCase1() {
        let matrix = [[1, 2, 8, 9],[2, 4, 9, 12],[4, 7, 10, 13],[6, 8, 11, 15]]
        XCTAssertTrue(solutuon.find(matrix, num: 12))
    }
    
    // 查找的数不在数组中
    func testCase2() {
        let matrix = [[1, 2, 8, 9],[2, 4, 9, 12],[4, 7, 10, 13],[6, 8, 11, 15]]
        XCTAssertFalse(solutuon.find(matrix, num: 12))
    }
    
    // 要查找的数是数组中最小的数字
    func testCase3() {
        let matrix = [[1, 2, 8, 9],[2, 4, 9, 12],[4, 7, 10, 13],[6, 8, 11, 15]]
        XCTAssertTrue(solutuon.find(matrix, num: 1))
    }
    
    // 要查找的数是数组中最大的数字
    func testCase4() {
        let matrix = [[1, 2, 8, 9],[2, 4, 9, 12],[4, 7, 10, 13],[6, 8, 11, 15]]
        XCTAssertTrue(solutuon.find(matrix, num: 15))
    }
    
    // 要查找的数比数组中最小的还要小
    func testCase5() {
        let matrix = [[1, 2, 8, 9],[2, 4, 9, 12],[4, 7, 10, 13],[6, 8, 11, 15]]
        XCTAssertFalse(solutuon.find(matrix, num: 0))
    }
    
    // 要查找的数比数组中最大的还要大
    func testCase6() {
        let matrix = [[1, 2, 8, 9],[2, 4, 9, 12],[4, 7, 10, 13],[6, 8, 11, 15]]
        XCTAssertFalse(solutuon.find(matrix, num: 20))
    }
}

UnitTests.defaultTestSuite.run()


