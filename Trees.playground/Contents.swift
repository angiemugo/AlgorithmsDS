import UIKit

// A tree has nodes that are linked to each other. A node without a parent is a root. A node without children is a leaf. A node has only one parent
// a tree is a simple form of a graph. A linked list is a version of a tree

// Tree - has one parent, can have multiple nodes, a way to add children. Creating a node

// height of tree - the number of links between the root node and the lowest leaf
// depth of a node - number of links between the node and the root nodr

public class TreeNode<T> {
    public weak var parent: TreeNode?
    public var value: T
    public var children = [TreeNode<T>]()

    public init(_ value: T) {
        self.value = value
    }

    public func addChild(_ node: TreeNode<T>) {
        children.append(node)
        node.parent = self
    }
}

extension TreeNode: CustomStringConvertible {
    public var description: String {
        var s = "\(value)"
        if !children.isEmpty {
            s += "{" + children.map { $0.description }.joined(separator: ",") + "}"
        }
        return s
    }
}

extension TreeNode where T: Equatable {
    func search(_ value: T)  -> TreeNode? {
        if value == self.value {
            return self
        }

        for child in children {
            if let found = child.search(value) {
                return found
            }
        }
        return nil
    }
}

