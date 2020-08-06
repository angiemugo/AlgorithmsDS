import UIKit

func isValid(_ s: String) -> Bool {
    var stack = [String]()
    let mapping = [")": "(", "}": "{", "]": "["]
    let stringArray = s.map { String($0) }
    for char in stringArray {
        if mapping[char] != nil {
            if !stack.isEmpty {
                print("\(stack)")
                stack.popLast()
            } else {
                let topElement = "#"
                print("\(mapping)")
                if mapping[char] != topElement {
                    return false
                }
            }
        } else {
            stack.append(char)
        }

    }
    return stack.isEmpty
}

let input = "()"
isValid(input)
