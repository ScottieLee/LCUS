//: Playground - noun: a place where people can play

/*

Reverse digits of an integer.

Example1: x = 123, return 321
Example2: x = -123, return -321

Have you thought about this?
Here are some good questions to ask before coding. Bonus points for you if you have already thought through this!

If the integer's last digit is 0, what should the output be? ie, cases such as 10, 100.

Did you notice that the reversed integer might overflow? Assume the input is a 32-bit integer, then the reverse of 1000000003 overflows. How should you handle such cases?

For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.

*/

func reverse(x: Int32) -> Int32 {
    if x < 0 {
        return -reverse(-x)
    }
    var current = x
    var bits = [Int8]()
    while (current > 0) {
        bits.append(Int8(current % Int32(10)))
        current = current / 10
    }
    var ret: Int32 = 0
    var beginAccum = false
    for bit in bits {
        if bit != 0 {
            beginAccum = true
        }
        if beginAccum {
            // Swift will make a crash when Integer overflows. Catch this case before it crashes
            guard ret < Int32.max / 10 - Int32(bit) else {
                return 0
            }
            ret = ret * 10 + Int32(bit)
        }
    }
    return ret
}

print(reverse(100))
print(reverse(1000000003))
print(reverse(-321))

