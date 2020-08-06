// the smaller goes to the left and the bigger goes to the right
// when inserting compare the value to the parent then to the left then to the right
// finding a place to insert a node takes 0(h) time where h is the height of the tree
// searching works the same as inserting a node
// Traversing the tree - inorder(because you look from smallest to largest) - look left, at the node and then the right. Pre-order - look at node, then left then right. postorder - look at left, then right and then the node
// Deleting nodes - after removing a node we replace either with its biggest child on the left or the smallest child on the right. if the removed node doesn't have children just disconnect it


public class BinarySearchTree<T: Comparable> {
    private(set) public var value: T
    private(set) public var parent: BinarySearchTree?
    private(set) public var leftChild: BinarySearchTree?
    private(set) public var rightChild: BinarySearchTree?

    public init(value: T) {
        self.value = value
    }

    public var isRoot: Bool {
        return self.parent == nil
    }

    public var isLeaf: Bool {
        return self.leftChild == nil && self.rightChild == nil
    }

    public var isLeftChild: Bool {
        return parent?.leftChild === self
    }

    public var isRightChild: Bool {
        return parent?.rightChild === self
    }

    public var hasLeftChild: Bool {
        return leftChild != nil
    }

    public var hasRightChild: Bool {
        return rightChild != nil
    }

    public var hasAnyChild: Bool {
        return hasLeftChild || hasRightChild
    }

    public var hasBothChildren: Bool {
        return hasRightChild && hasLeftChild
    }

    public var count: Int { // counts how many nodes are in the subtree
        return (leftChild?.count ?? 0) + 1 + (rightChild?.count ?? 0)
    }

    func insert(_ value: T) {
        // check if value is less than or bigger then go to the left, if there's no left then insert it there
        // then check out right, if there's no right then insert there. If no then recurse
        if value < self.value {
            if let left = leftChild {
                left.insert(value)
            } else {
                leftChild = BinarySearchTree(value: value)
                leftChild?.parent = self
            }
        } else {
            if let right = rightChild {
                right.insert(value)
            } else {
                rightChild = BinarySearchTree(value: value)
                rightChild?.parent = self
            }
        }
    }

    func insertIterative(_ value: T) {
        while true {
            if value < self.value {
                if let left = leftChild {
                    self.value = left as! T
                } else {
                    BinarySearchTree(value: value)
                    return
                }
            } else {
                if let right = rightChild {
                    self.value = right as! T
                } else {
                    BinarySearchTree(value: value)
                }
            }
        }
    }

    public func search(_ value: T) -> BinarySearchTree? {
        if value < self.value {
            return leftChild?.search(value)
        } else if self.value > self.value {
            return rightChild?.search(value)
        } else {
            return self
        }
    }

    public convenience init(array: [T]) {
        precondition(array.count > 0)
        self.init(value: array.first!)
        for v in array.dropFirst() {
            insert(v)
        }
    }

    public func traverseInOrder(process: (T) -> Void) {
        leftChild?.traverseInOrder(process: process)
        process(value)
        rightChild?.traverseInOrder(process: process)
    }

    public func traversePreOrder(process: (T) -> Void) {
        process(value)
        leftChild?.traverseInOrder(process: process)
        rightChild?.traverseInOrder(process: process)
    }
    public func postOrder(process: (T) -> Void) {
        leftChild?.traverseInOrder(process: process)
        rightChild?.traverseInOrder(process: process)
        process(value)
    }

    public func map(formula: (T) -> T) -> [T] {
        var a = [T]()
        if let left = leftChild { a += left.map(formula: formula) }
        a.append(formula(value))
        if let right = rightChild { a += right.map(formula: formula) }
        return a
    }

    public func toArray() -> [T] {
        return map { $0 }
    }

    public func reconnectParentTo(node: BinarySearchTree?) {
        if let parent = parent {
            if isLeftChild {
                parent.leftChild = node
            } else {
                parent.rightChild = node
            }
        }
        node?.parent = parent
    }

    public func minimum() -> BinarySearchTree {
        var node = self
        while let next = node.leftChild {
            node = next
        }
        return node
    }

    public func maximum() -> BinarySearchTree {
        var node = self
        while let next = node.rightChild {
            node = next
        }
        return node
    }

    public func remove() -> BinarySearchTree? {
        let replacement: BinarySearchTree?
        if let right = rightChild {
            replacement = right.minimum()
        } else if let left = leftChild {
            replacement = left.maximum()
        } else {
            replacement = nil
        }
        replacement?.remove()

        replacement?.rightChild = rightChild
        replacement?.leftChild = leftChild

        rightChild?.parent = replacement
        leftChild?.parent = replacement
        reconnectParentTo(node: replacement)

        parent = nil
        leftChild = nil
        rightChild = nil

        return replacement
    }

    public func height() -> Int { // distance to the lowest node
        if isLeaf {
            return 0
        } else {
            return 1 + max(leftChild?.height() ?? 0, rightChild?.height() ?? 0)
        }
    }

    public func depth() -> Int { // distance to root
        var node = self
        var edges = 0
        while let parent = node.parent {
            node = parent
            edges += 1
        }
        return edges
    }

    public func predecessor() -> BinarySearchTree<T>? {
        if let left = leftChild {
            return left.maximum()
        } else {
            var node = self
            while let parent = node.parent {
                if parent.value < value { return parent }
                node = parent
            }
            return nil
        }
    }

    public func successor() -> BinarySearchTree<T>? {
        if let right = rightChild {
            return right.minimum()
        } else {
            var node = self
            while let parent = node.parent {
                if parent.value > value {
                    return parent
                }
                node = parent
            }
            return nil
        }
    }

    public func isBSt(minValue: T, maxValue: T) -> Bool {
        if value < minValue || value > maxValue { return false }
        let leftBST = leftChild?.isBSt(minValue: minValue, maxValue: maxValue) ?? true
        let rightBST = rightChild?.isBSt(minValue: minValue, maxValue: maxValue) ?? true
        return leftBST && rightBST
    }
}

extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        var s = ""
        if let left = leftChild {
            s += "\(left.description)"
        }
        s += "\(value)"
        if let right = rightChild {
            s += " -> (\(right.description))"
        }
        return s
    }
}

let tree = BinarySearchTree<Int>(array: [7, 2, 5, 10, 9, 1])
tree.traverseInOrder { value in print(value) }
if let node9 = tree.search(9) {
    node9.depth()
}
