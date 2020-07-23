//import UIKit
//
//var str = "Hello, playground"
//
//func repeatedString(_ s: [Character], _ n: Int) -> Int {
//    var string = [Character]()
//    var count = 0
//    for i in s {
//        while string.count < 10 {
//            print(string)
//            string.append(i)
//            if i == "a" {
//                count += 1
//            }
//        }
//    }
//    return count
//}
//repeatedString(["a", "b", "a"], 10)
//
//func repeatedString(s: String, n: Int) -> Int {
//    let input = readLine()!.characters.map{String($0)}
//    let n = Int(String(readLine()!))!
//
//    let expectation = "a"
//
//    var output = 0
//
//    for (index, i) in input.enumerate() where i == expectation {
//        output += n / input.count
//    }
//
//    for i in 0..<(n % input.count) {
//        if input[i] == expectation {
//            output += 1
//        }
//    }
//
//    print(output)
//}














func repeatedString(_ stringToRepeat: String, numberToConsider: Int) -> Int {
    var count = 0
    var indexOfCharacter = 0
    for i in stringToRepeat {
        indexOfCharacter += 1
        if i == "a" {
            if numberToConsider % stringToRepeat.count >= indexOfCharacter {
                count += 1
            }
            count += numberToConsider / stringToRepeat.count
        }
    }


    return count
}

repeatedString("aba", numberToConsider: 10)
