import UIKit

func reverseArray(a: [Int]) -> [Int] {
    var reversedArray = [Int]()
    for i in 0..<a.count {
        let j = a.count - i
        reversedArray.append(a[j-1])
    }
    return reversedArray
}

reverseArray(a: [2,4,5,6,7])
