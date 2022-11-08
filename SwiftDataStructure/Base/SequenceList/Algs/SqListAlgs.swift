//
//  SqListAlgs.swift
//  SwiftDataStructure
//
//  Created by Smallfan on 2022/11/6.
//

import Foundation

class SqListAlgs {
    
    // LC26
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var slow = 0
        var fast = 0
        while fast < nums.count {
            if nums[slow] != nums[fast] {
                slow += 1
                nums[slow] = nums[fast]
            }
            fast += 1
        }
        
        return slow + 1
    }
    
    // LC27
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var slow = 0
        var fast = 0
        while fast < nums.count {
            if nums[fast] != val {
                nums[slow] = nums[fast]
                slow += 1
            }
            fast += 1
        }
        
        return slow
    }
    
    // LC283
    func moveZeroes(_ nums: inout [Int]) {
        let n = removeElement(&nums, 0)
        for i in n ..< nums.count {
            nums[i] = 0
        }
    }
    
    // LC167
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var left = 0, right = numbers.count - 1
        while left < right {
            var sum = numbers[left] + numbers[right]
            if sum == target {
                return [left + 1, right + 1]
            } else if sum < target {
                left += 1
            } else {
                right -= 1
            }
        }
        
        return [-1, -1]
    }
    
    // LC344
    func reverseString(_ s: inout [Character]) {
        var left = 0, right = s.count - 1
        while left < right {
            let temp = s[left]
            s[left] = s[right]
            s[right] = temp
            left += 1
            right -= 1
        }
    }
    
    func palindrome(s: String, l: Int, r: Int) -> String {
        var l = l, r = r
        while l >= 0 && r < s.count {
            let n = l > 0 ? l : 0
            let m = r > 0 ? r : 0
            let lChar = s.dropFirst(n).prefix(1)
            let rChar = s.dropFirst(m).prefix(1)
            if lChar == rChar {
                l -= 1
                r += 1
            } else {
                break
            }
        }
        
        return String(s.dropFirst(l + 1).prefix(r - l - 1))
    }
    
    // LC5
    func longestPalindrome(_ s: String) -> String {
        var result = ""
        for i in 0 ..< s.count {
            let s1 = palindrome(s: s, l: i, r: i)
            let s2 = palindrome(s: s, l: i, r: i + 1)
            if result.count < s1.count {
                result = s1
            }
            if result.count < s2.count {
                result = s2
            }
        }
        return result
    }
}
