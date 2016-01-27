//: 5. Longest Palindromic Substring


/*
Given a string S, find the longest palindromic substring in S. You may assume that the maximum length of S is 1000, and there exists one unique longest palindromic substring.
*/


/// DP Solution

/*

DP[i+1][j-1] = true when  DP[i][j] == true && DP[i+1]][j-1]
             = false other

Initial: 
DP[i][j] = true where i = j

Interation Direction
i >= j that make sense.

for i in decent order
    for j in decent order

*/

func findLongestPalindromicSubStringWithString(str: String) -> String {
    var dp = [[Bool]](count: str.characters.count, repeatedValue: [Bool](count: str.characters.count, repeatedValue: false))
    var maxGap = 0
    var retI = 0
    var retJ = 0
    for i in (0 ... str.characters.count - 1).reverse() {
        for j in (0 ... str.characters.count - 1).reverse() {
            if i >= j {
                dp[i][j] = true
                continue
            }
            if i < str.characters.count - 1 && j >= 1 {
                if dp[i+1][j-1] == true && str[str.startIndex.advancedBy(i)] == str[str.startIndex.advancedBy(j)] {
                    dp[i][j] = true
                    if j - i > maxGap {
                        maxGap = j - i
                        retI = i
                        retJ = j
                    }
                    continue
                }
            }
        }
    }
    print("\(retI), \(retJ)")
    return str[str.startIndex.advancedBy(retI) ... str.startIndex.advancedBy(retJ)]
}

let string = "abcdfeggefdcxurkeekrabc"
print("\(findLongestPalindromicSubStringWithString(string))")
