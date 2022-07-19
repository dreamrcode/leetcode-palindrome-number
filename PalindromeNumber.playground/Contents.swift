/**
 Given an integer x, return true if x is palindrome integer.
 An integer is a palindrome when it reads the same backward as forward.
 For example, 121 is a palindrome while 123 is not.
  
 Example 1:
 Input: x = 121
 Output: true
 Explanation: 121 reads as 121 from left to right and from right to left.
 
 Example 2:
 Input: x = -121
 Output: false
 Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
 
 Example 3:
 Input: x = 10
 Output: false
 Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
  
 Constraints:
 -2^31 <= x <= 2^31 - 1
  
 Follow up: Could you solve it without converting the integer to a string?
 */


import UIKit
import Darwin

class Solution {
    
    func isPalindrome(_ x: Int) -> Bool {
        
        // check if x is not within constraints
        if !isWithinConstraints(number: x) {
            return false
        }
        
        // convert x into a string
        let xString = String(x)
        
        // return if both are the same
        return xString == String(xString.reversed())
    }
    
    func isPalindromeFollowUp(_ x: Int) -> Bool {
        
        // check if x is not within constraints
        if !isWithinConstraints(number: x) {
            return false
        }
        
        // variable to hold the reversed value
        var xReversed = 0
        
        // variable to hold x's original value
        var xValue = x
        
        while xValue != 0 {
            
            // get last digit after % 10
            // Ex: 1010 % 10 = 0; 1234 % 10 = 4
            let remainder = xValue % 10
            
            // multiply the current value of xReversed, and add the remainder
            xReversed = xReversed * 10 + remainder
            
            // drop the last digit to xValue. The last digit will drop because xValue is an Int.
            // Example: 4345 / 10 = 434.5, but as an Int, 434
            xValue /= 10
        }
        
        return x == xReversed
    }
    
    // check if the number passed is within given constraints.
    private func isWithinConstraints(number: Int) -> Bool {
        return number >= 0 && Decimal(number) >= pow(-2,31) && Decimal(number) <= pow(2,31) - 1
    }
}

// Test Solutions
let solution = Solution()
solution.isPalindrome(121)
solution.isPalindrome(-121)
solution.isPalindrome(10)
solution.isPalindrome(111121111)

solution.isPalindromeFollowUp(121)
solution.isPalindromeFollowUp(-121)
solution.isPalindromeFollowUp(10)
solution.isPalindromeFollowUp(111121111)
