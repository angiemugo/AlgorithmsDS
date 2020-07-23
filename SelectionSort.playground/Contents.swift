import UIKit

func insertionSort(_ array: [Int]) -> [Int]{
    var list = array
    guard list.count > 1 else { return list }

    for i in 0..<list.count - 1 {
        var smallestIndex = i

        for j in i + 1..<list.count {
            if list[j] < list[smallestIndex] {
                smallestIndex = j
            }
        }

        if i != smallestIndex {
            list.swapAt(i, smallestIndex)
        }
    }
    return list
}

let array = [ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ]
print("\(insertionSort(array))")
