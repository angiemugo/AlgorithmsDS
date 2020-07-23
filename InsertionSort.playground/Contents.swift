var list = [3,5,8,4,6]

func insertionSort(_ array: [Int]) {
    var list = array

    for x in 1..<list.count {
        var y = x
        while y > 0 && list[y] < list[y-1] {
            let temp = list[y-1]
            list[y-1] = list[y]
            list[y] = temp
            y -= 1
        }
    }
}

func efficientSort(_ array: [Int]) -> [Int] {
    var array = list
    for x in 1..<array.count {
        var y = x
        let temp = array[y]
        while y>0 && temp < array[y-1] {
            array[y] = array[y-1]
            y -= 1
        }

        array[y] = temp
    }
    return array
}

insertionSort(list)
efficientSort(list)







