import Foundation
//
//func fibonacci(_ number: Int) -> [Int] {
//    var a = 0
//    var b = 1
//    var fibArray = [Int]()
//
//    for _ in 0..<number {
//        fibArray.append(a)
//        let tempB = a + b
//        a = b
//        b = tempB
//    }
//    return fibArray
//}
//
//fibonacci(10)
//
//func fib(_ n: Int) -> Int {
//    var a = 0
//    var b = 1
//
//    (2...n).forEach { _ in
//        (a,b) = (a + b, a)
//        print("This is a: \(a), b: \(b)")
//    }
//    return a
//}
//
//fib(10)

//
//func fibonacci(_ nthFibonacciNumber: Int) -> Int {
//    var firstNumber = 0
//    var secondNumber = 1
//
//
//    for i in 0...nthFibonacciNumber {
//        if i < 2 {
//            print("This is i \(i), sum: \(i)")
//        } else {
//
//        let sum = firstNumber + secondNumber
//        print("This is i \(i), sum: \(sum)")
//        firstNumber = secondNumber
//        secondNumber = sum
//        }
//
//    }
//    return secondNumber
//}
//
////fibonacci(10)
//
//func recursionFib(_ nthFibonacciNumber: Int) -> Int {
//    print("This is it: \(nthFibonacciNumber)")
//    if nthFibonacciNumber <= 1 {
//        print("This is other it: \(nthFibonacciNumber)")
//        return nthFibonacciNumber
//    }
//    return recursionFib(nthFibonacciNumber - 1) + recursionFib(nthFibonacciNumber - 2)
//}
//
//recursionFib(3)

func prime(_ nthNumber: Int) -> [Int] {
    var primeNumbers = [Int]()

    for i in 2..<nthNumber {
        var prime = true
        for j in 2..<i {
            if i % j == 0 {
                prime = false
                break
            }
        }
        if prime {
            primeNumbers.append(i)
        }
    }

    return primeNumbers
}

prime(10)

func isPrime(_ nthNumber: Int, _ divisor: Int = 2) -> Bool {
    print("Divisor: \(divisor)")
    if nthNumber == 2 { return true }

    if nthNumber % divisor == 0 {
        return false
    }

    if nthNumber <= (divisor * divisor) {
        return true
    }

    return isPrime(nthNumber, divisor + 1)
}

isPrime(3793)
