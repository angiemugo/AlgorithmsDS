import UIKit

func reverseString(_ s: inout [Character]) {
    for i in 0..<s.count / 2 {
        s.swapAt(s.count - 1 - i, i)
    }
}
var array: [Character] = ["a", "b", "c", "d"]
reverseString(&array)

func reverseWords(_ s: String) -> String {
    var wordsArray = s.components(separatedBy: " ").filter { $0 != ""}
    print("\(wordsArray)")
    for i in 0..<wordsArray.count / 2 {
        wordsArray.swapAt(wordsArray.count - 1 - i, i)
    }
    let wordString = wordsArray.joined(separator: " ")
    return wordString
}

let words = "  hello world!  "
reverseWords(words)

func reverseWords2(_ s: inout [Character]) {
    if s[0] == Character("") {
        s.dropFirst()
    }

    if s[s.count - 1] == Character("") {
        s.dropLast()
    }

    for i in 0..<s.count / 2 {
        s.swapAt(s.count - 1 - i, i)
    }
}

var input: [Character] = ["t","h","e"," ","s","k","y"," ","i","s"," ","b","l","u","e"]
reverseWords2(&input)
