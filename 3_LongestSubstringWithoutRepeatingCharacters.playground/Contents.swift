/* 3. Longest Substring Without Repeating Characters */

/*

Given a string, find the length of the longest substring without repeating characters. For example, the longest substring without repeating letters for "abcabcbb" is "abc", which the length is 3. For "bbbbb" the longest substring is "b", with the length of 1.

*/


/// O(N) solution. Using a hash table

func LongestSubstringWithouRepeatingCharacters(string:String) -> UInt {
    var dict = [Character: Int]()
    
    var length:UInt = 0
    var maxLength:UInt = 0
    
    for (_, char) in string.characters.enumerate() {
        if (dict[char] == nil) {
            length++
            dict[char] = 1
        } else {
            length = 1
            dict.removeAll()
            dict[char] = 1
        }
        maxLength = max(length, maxLength)
    }
    return maxLength
}

print(LongestSubstringWithouRepeatingCharacters("aabcddeeffghijckabee"))
print(LongestSubstringWithouRepeatingCharacters("bbbbbbbbbb"))
print(LongestSubstringWithouRepeatingCharacters("abcabcbb"))