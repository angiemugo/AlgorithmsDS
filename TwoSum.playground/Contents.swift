func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var numsDict = [Int: Int]()

    for i in 0..<nums.count {
        let diff = target - nums[i]
        if numsDict[diff] != nil {
            return [i, numsDict[diff]!]
        } else {
            numsDict[nums[i]] = i
        }
    }
    return []
}

func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
    let sortedArray = nums.sorted()
    var right = sortedArray.count - 1
    var left = 0

    while left < right {
        if sortedArray[left] + sortedArray[right] == target {
            return [left, right]
        } else if sortedArray[left] + sortedArray[right] < target {
            left += 1
        }  else if sortedArray[left] + sortedArray[right] > target {
            right -= 1
        }
    }
    return []
}

// we would need to find the index of the numbers in the old array

//print(twoSum([3,2,4], 6))
print(twoSum2([3,2,4], 6))
