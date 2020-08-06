import UIKit

class MinMaxStack {
    var minMaxStack = [(Int, Int)]()
    var stack = [Int]()

    func peek() -> Int {
        return stack[stack.count - 1]
    }

    func pop() -> Int? {
        minMaxStack.popLast()
        return stack.popLast()
    }

    func push(_ value: Int) {
        if !stack.isEmpty {
            guard let lastMinMax = minMaxStack.last else { return }
            let newMin = min(lastMinMax.0, value)
            let newMax = max(lastMinMax.1, value)
            minMaxStack.append((newMin, newMax))
        } else {
            minMaxStack = [(value, value)]
        }
        stack.append(value)
    }

    func getMin() -> Int {
        return minMaxStack[stack.count - 1].0
    }

    func getMax() -> Int {
        return minMaxStack[stack.count - 1].1
    }
}
