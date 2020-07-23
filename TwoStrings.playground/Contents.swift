import UIKit

func twoStrings1(_ s1: String, _ s2: String) -> String {
    for word1 in s1 {
        for word2 in s2 {
            if word1 == word2 {
                return "YES"
            }
        }
    }
    return "NO"
}

twoStrings1("and", "buta")

func twoStrings(_ s1: String, _ s2: String) -> String {


    
    return "NO"
}
twoStrings("and", "buta")



