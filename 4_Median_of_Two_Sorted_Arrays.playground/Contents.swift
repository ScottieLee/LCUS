
/*
4. Median of Two Sorted Arrays
*/

/*

There are two sorted arrays nums1 and nums2 of size m and n respectively. Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).

*/


/*

Find Kth in two sorted array problem: If A[k/2-1] < B[k/2-1], that means all the elements from A[0] to A[k/2-1](i.e. the k/2 smallest elements in A) are in the range of k smallest elements in the union of A and B.

If length of A < k/2

Then the Kth problem becomes the K - [K/2] problem.

*/


func findMedianSortedArrays(array1:[Int], array2:[Int]) -> Double {
    let count = array1.count + array2.count
    if count % 2 == 1 {
        return Double(findKth(array1, array2: array2, k: count / 2 + 1))
    } else {
        return ( Double(findKth(array1, array2: array2, k: count / 2 + 1)) + Double(findKth(array1, array2: array2, k: count / 2)) ) / 2
    }
}

func findKth(array1:[Int], array2:[Int], k:Int) -> Int {
    
    
    var halfK = k / 2
    
    // Since we calculate recusively, make case as simple as possible
    // array1's count always less or equal to array2's count
    if array1.count > array2.count {
        return findKth(array2, array2: array1, k: k)
    }
    
    halfK = min(array1.count, halfK)
    
    
    if array1.count == 0 {
        return array2[k-1]
    }
    
    if k == 1 {
        return min(array1.first!, array2.first!)
    }

    let indexOfArray1 = halfK - 1
    let indexOfArray2 = k - halfK - 1
    
    if array1[indexOfArray1] < array2[indexOfArray2] {
        let newArray1 = Array(array1.suffixFrom(halfK))
        // A[0] to A[k/2-1](i.e. the k/2 smallest elements in A) are in the range of k smallest elements
        // Then the Kth problem becomes the K - [K/2] problem.
        return findKth(newArray1, array2: array2, k: k - halfK)
    } else if array1[indexOfArray1] > array2[indexOfArray2] {
        // B[0] to B[x] are in the range of k smallest elements
        // Then the Kth problem becomes the K - x problem.
        let newArray2 = Array(array2.suffixFrom(k - halfK))
        return findKth(array1, array2: newArray2, k: k - (k - halfK))
    } else {
        return array1[indexOfArray1]
    }
}


/* Test Case */

var array1 = [2, 3, 5, 6, 12, 13]
var array2 = [4, 7, 10, 15]

/* 2 3 4 5 6 7 10 12 13 15 */

var ret = findMedianSortedArrays(array1, array2: array2)
assert(ret == 6.5)

array1 = [2, 100]
array2 = [0, 3, 10]

/* 0 2 3 10 100 */

ret = findMedianSortedArrays(array1, array2: array2)
assert(ret == 3)




