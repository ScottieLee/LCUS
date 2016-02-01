
/*

9. Determine whether an integer is a palindrome. Do this without extra space.


*/

import Foundation

func isPalindrome(string: String) -> Bool {
    if string.characters.count <= 1 {
        return true
    }
    if string.characters.first != string.characters.last {
        return false
    } else {
        return isPalindrome(string.substringWithRange(Range(start: string.startIndex.advancedBy(1), end: string.endIndex.advancedBy(-1))))
    }
}

print(isPalindrome("ab"))
print(isPalindrome("a"))
print(isPalindrome("abc"))
print(isPalindrome(""))
print(isPalindrome("abcdefedcb"))
