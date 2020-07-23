import UIKit

var str = "Hello, playground"

func checkMagazine(magazine: [String], note: [String]) {
    var magazineDict = [String: Int]()
    for word in magazine {
        if magazineDict[word] != nil {
            magazineDict[word]! += 1
        } else {
            magazineDict[word] = 1
        }
    }

    for word in note {
        guard let magazine = magazineDict[word], magazine > 0 else {
            print("No")
            return
        }
        magazineDict[word]! -= 1
    }
    print("Yes")

}

checkMagazine(magazine: ["o", "l", "x", "imjaw", "bee", "khmla", "v", "o", "v", "o", "imjaw", "l", "khmla", "imjaw", "x"], note: ["imjaw", "l", "khmla", "x", "imjaw", "o", "l", "l", "o", "khmla", "v", "bee", "o", "o", "imjaw", "imjaw", "o"])
let array = "imjaw l khmla x imjaw o l l o khmla v bee o o imjaw imjaw o"
print(array.split(separator: " "))

