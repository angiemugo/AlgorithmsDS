import UIKit

var str = "Hello, playground"

func sockMerchant(_ numberOfSocks: Int, _ input: [Int]) -> Int {
 var resultCount = 0
    var resultSet = Set<Int>()

    for inputItem in input {
        if resultSet.contains(inputItem) {
            resultSet.remove(inputItem)
            resultCount += 1
        } else {
            resultSet.insert(inputItem)
        }
    }
    return resultCount
}
sockMerchant(9, [10, 20, 20, 10, 10, 30, 50, 10, 20])

