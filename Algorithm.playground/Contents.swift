import UIKit

var str = "Hello, playground"


func getValleys(_ stepsNumber: Int, steps: String) -> Int {
    var currentLevel = 0
    let seaLevel = 0
    var isInValley = false
    var valleysWalked = 0

    for step in Array(steps) {
        if step == "U" {
            currentLevel += 1
        } else {
            currentLevel -= 1
        }

        if currentLevel == seaLevel && isInValley {
            isInValley = false
            valleysWalked += 1
        }

        if currentLevel < seaLevel && !isInValley {
            isInValley = true
        }
    }
    return valleysWalked
}

print(getValleys(5, steps: "DDUUD"))

func getClouds(_ clouds: [Int]) -> Int {
    var currentIndex = 0
    var numberOfJumps = 0

    while currentIndex < clouds.count - 1 {
        if clouds[currentIndex] != 1, currentIndex + 2 < clouds.count {
                currentIndex += 2
            } else {
                currentIndex += 1
            }
            numberOfJumps += 1
        }
    return numberOfJumps
}

getClouds([0, 0, 0, 0, 1, 0])

