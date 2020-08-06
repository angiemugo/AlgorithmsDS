import Foundation
//import Glibc

// you can write to stdout for debugging purposes, e.g.
// print("this is a debug message")


//public func  StringProtocol {
//    subscript(offset: Int) -> Character { self[index(startIndex, offsetBy: offset)] }
//    subscript(range: Range<Int>) -> SubSequence {
//        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
//        return self[startIndex..<index(startIndex, offsetBy: range.count)]
//    }
//    subscript(range: ClosedRange<Int>) -> SubSequence {
//        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
//        return self[startIndex..<index(startIndex, offsetBy: range.count)]
//    }
//    subscript(range: PartialRangeFrom<Int>) -> SubSequence { self[index(startIndex, offsetBy: range.lowerBound)...] }
//    subscript(range: PartialRangeThrough<Int>) -> SubSequence { self[...index(startIndex, offsetBy: range.upperBound)] }
//    subscript(range: PartialRangeUpTo<Int>) -> SubSequence { self[..<index(startIndex, offsetBy: range.upperBound)] }
//}

public func solution(_ blocks : inout [Int]) -> Int {
    var max: Int = 0
    for startIndex in 0..<blocks.count {
        var right = startIndex
        var left = startIndex

        while left >= 0 && right < blocks.count {
            if left > 0 && blocks[left - 1] >= blocks[left] {
                left -= 1
            } else if right < blocks.count - 1 && blocks[right + 1] >= blocks[right] {
                right += 1
            } else {
                break
            }
        }

        print("StartIndex: \(startIndex), \(left), \(right)")


        let localMax = right - left + 1
        if localMax > max {
            max = localMax
        }
    }
    return max
}

var list = [2, 6, 8, 5]

solution(&list)

public func solution(_ S : inout String) -> Int {
    let stringArray =  S.map { String($0) }
    return deleteString(stringArray, index: 0, deletingB: true)
}

func deleteString(_ text: [String], index: Int, deletingB: Bool) -> Int {
    if index == text.count {
        return 0
    }
    print(text[index])

    if text[index] == "A" {
        if !deletingB {
            return 1 + deleteString(text, index: index + 1, deletingB: false)
        }
        return min(1 + deleteString(text, index: index + 1, deletingB: false),
                   deleteString(text, index: index + 1, deletingB: true))
    } else {
        if !deletingB {
            return deleteString(text, index: index + 1, deletingB: false)
        }
        return min(1 + deleteString(text, index: index + 1, deletingB: true),
                   deleteString(text, index: index + 1, deletingB: false))
    }
}
var string = "BAAABAB"
solution(&string)



