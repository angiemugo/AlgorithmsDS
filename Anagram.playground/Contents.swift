import UIKit

var str = "Hello, playground"

func anagram(_ input: String) -> Int {
    return 1
}

protocol Versionable {
    associatedtype Version
    var version: Version { get }
    func migrateToVersion(_ version: Version) -> Self
}

var versionables: [Versionable] = []
