
/*

The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

P   A   H   N
A P L S I I G
Y   I   R

And then read line by line: "PAHNAPLSIIGYIR"

Write the code that will take a string and make this conversion given a number of rows:

string convert(string text, int nRows);

convert("PAYPALISHIRING", 3) should return "PAHNAPLSIIGYIR".


nRows = 4

P     I     N
A   L S   I G
Y A   H R
P     I

there are 7 colums


nRows = 5

P       H
A     S I
Y   I   R
P L     I G
A       N

there are 6 colums


zigzaglength = (nRows + nRows -2)
nZigzaglength = legnth / zigzaglength
nColums = nZigzaglength * (nRows - 1) + 1 + (length % zigzaglength) % nRows

*/

// Solution 1

func convert(text: String, nRows: Int) -> String {
    
    let len = text.characters.count
    let zigzaglen = 2 * (nRows - 1)
    let nZigZagLen: Int = len / zigzaglen
    let nColums: Int = nZigZagLen * (nRows - 1) + 1 + max(0, (len % zigzaglen - nRows) % nRows)
    var matrix = [[Character]](count: nRows, repeatedValue:[Character](count: nColums, repeatedValue:" "))
    var i = 0, j = 0
    for char in text.characters {
        matrix[i][j] = char
        i++
        if i == nRows || (j % (nRows-1)) != 0 {
            i = i - 2
            j++
        }
    }
    var retStr = ""
    for i in (0 ... nRows - 1) {
        for j in (0 ... nColums - 1) {
            if matrix[i][j] != " " {
                retStr.append(matrix[i][j])
            }
        }
    }
    return retStr
}

print(convert("PAYPALISHIRING", nRows: 3))
print(convert("PAYPALISHIRING", nRows: 4))

// Solution 2
