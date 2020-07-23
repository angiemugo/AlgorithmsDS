// This is a stable sort; array elements that have identical sort keys will stay in the same order relative to each other after sorting

func mergeSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    let midIndex = array.count / 2
    let leftPile = mergeSort(Array(array[0..<midIndex]))
    let rightPile = mergeSort(Array(array[midIndex..<array.count]))
    return merge(leftPile: leftPile, rightPile: rightPile)
}

func merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0
    var orderedPile = [Int]()

    while leftIndex < leftPile.count && rightIndex < rightPile.count {
        if leftPile[leftIndex] < rightPile[rightIndex] {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        } else if leftPile[leftIndex] > rightPile[rightIndex] {
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        } else {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
    }

    while leftIndex < leftPile.count {
        orderedPile.append(leftPile[leftIndex])
        leftIndex += 1
    }
    while rightIndex < rightPile.count {
        orderedPile.append(rightPile[rightIndex])
        rightIndex += 1
    }
    return orderedPile
}

mergeSort([2, 1, 5, 4, 9])


func mergeSortBottomUp<T>(_ a: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
    let n = a.count

    var z = [a, a]      // 1 this is a tuple of two arrays, z[d] is used for reading and z[1-d] is used for writing
    var d = 0 // this is either 0 or 1

    var width = 1 // gives width of pile 
    while width < n {   // 2
        var i = 0
        while i < n {     // 3
            var j = i
            var l = i
            var r = i + width

            let lmax = min(l + width, n)
            let rmax = min(r + width, n)

            while l < lmax && r < rmax {                // 4
                if isOrderedBefore(z[d][l], z[d][r]) {
                    z[1-d][j] = z[d][l]
                    l += 1
                } else {
                    z[1 - d][j] = z[d][r]
                    r += 1
                }
                j += 1
            }
            while r < rmax {
                z[1 - d][j] = z[d][r]
                j += 1
                r += 1
            }

            i += width*2
        }

        width *= 2
        d = 1 - d      // 5
    }
    return z[d]
}
