
/* 1. Two Sum */

/*

Given an array of integers, find two numbers such that they add up to a specific target number.

The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2. Please note that your returned answers (both index1 and index2) are not zero-based.

You may assume that each input would have exactly one solution.

Input: numbers={2, 7, 11, 15}, target=9
Output: index1=1, index2=2

*/

/// O(N) solution. Use hash

func twoSum(array:[Int], target:Int) -> (Int, Int) {
    var dict = [Int: Int]()
    
    for (idx, num) in array.enumerate() {
        dict[num] = idx
    }
    
    for (_, (numAsKey, idxAsValue)) in dict.enumerate() {
        let resValue = target - numAsKey
        if let resIdx = dict[resValue] {
            let ret = resIdx < idxAsValue ?(resIdx, idxAsValue):(idxAsValue, resIdx)
            return ret
        }
    }
    return (0, 0)
}


/// O(Nlog(N)) solution. Sort and search. This solution cannot return indexes
func twoSum2(array:[Int], target:Int) -> (Int, Int) {
    let sortedArray = array.sort(<)
    
    var i = 0
    var j = sortedArray.count - 1
    
    while (i < j) {
        if sortedArray[i] + sortedArray[j] > target {
            --j
        } else if sortedArray[i] + sortedArray[j] < target {
            ++i
        } else {
            return (sortedArray[i], sortedArray[j])
        }
    }
    return (0, 0)
}


// Test Case

let testArray = [3, 2, 4]
let targetSum = 6

let result = twoSum(testArray, target: targetSum)
assert(result.0 == 1 && result.1 == 2)
