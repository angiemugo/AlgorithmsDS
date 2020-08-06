import UIKit

var str = "Hello, playground"

func longestPalindrome(_ s: String) -> String {
    let stringArray = s.map { String($0) }
    var newArray = ArraySlice<String>()

    let midPoint = stringArray.count / 2

    var minPointer = midPoint - 1
    var maxPointer = midPoint + 1


    while minPointer >= 0 && maxPointer < stringArray.count {
        print("\(minPointer)")
             print("\(maxPointer)")
    if stringArray[minPointer] != stringArray[maxPointer] {

        newArray = stringArray[minPointer..<maxPointer]
    } else {
        minPointer -= 1
        maxPointer += 1
        }
    }

    return newArray.joined()
}

longestPalindrome("babad")
