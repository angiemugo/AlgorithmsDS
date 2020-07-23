import UIKit

var str = "Hello, playground"

func primeNumbers(_ number: Int) -> [Int] {
    var primeNumbers = [Int]()

    for i in 2...number {
        var prime = true
        for j in (2..<i) {
            if i % j == 0 {
                prime = false
            }
        }
        if prime {
            primeNumbers.append(i)
        }
    }
    return primeNumbers
}

primeNumbers(15)
