import UIKit

func isPalindrome(_ s: String) -> Bool {
    guard s.count > 1 else { return true }
    let stringArray = String(s.lowercased().filter { $0.isLetter || $0.isNumber }).map { $0 }
    var upperLimit = stringArray.count - 1
    var lowerLimit = 0

    while lowerLimit < upperLimit {
        if stringArray[upperLimit] != stringArray[lowerLimit] {
            return false
        }
        upperLimit -= 1
        lowerLimit += 1
    }
    return true
}

func isPalindromeRecursive(_ s: String, _ index: Int = 0) -> Bool {
    let stringArray = String(s.lowercased().filter { $0.isLetter || $0.isNumber }).map { $0 }
    return smallFunction(stringArray)
}

func smallFunction(_ stringArray: [String.Element], _ index: Int = 0) -> Bool {
    let j = stringArray.count - 1 - index
    if j >= index {
        return true
    }
    if stringArray[index] != stringArray[j] {
        return false
    } else {
        return smallFunction(stringArray, index + 1)
    }
}

isPalindrome("0P")
