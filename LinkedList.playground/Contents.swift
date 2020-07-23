import UIKit
// unlike array, linked list stores objects as separate entities
// we have singly linked list that have reference to next one while doubly linked list have access to the next and previous nodes
// keep track of where the list begins - that's a head. Where it ends that's a tail
// you can't access certain nodes if you don't have them. You have to work yopur way from the head or tail
// a singly linked list uses less memory because it doesn't keep reference to the previous node. However a doubly linked list is easier to use

public class LinkedListNode<T> {
    var value: T
    var next: LinkedListNode?
    weak var previous: LinkedListNode?

    public init(value: T) {
        self.value = value
    }
}

public class LinkedList<T> {
    public typealias Node = LinkedListNode<T>

    private var head: Node?

    public var isEmpty: Bool {
        return head == nil
    }

    public var first: Node? {
        return head
    }

    public var last: Node? {
        guard var node = head else {
            return nil
        }

        while let next = node.next {
            node = next
        }
        return node
    }

    public func append(value: T) {
        let newNode = Node(value: value)
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }

    public var count: Int {
        guard var node = head else {
            return 0
        }

        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }

    public func node(atIndex index: Int) -> Node {
        if index == 0 {
            return head!
        } else {
            var node = head!.next
            for _ in 1..<index {
                node = node?.next
                if node == nil { //(*1)
                    break
                }
            }
            return node!
        }
    }

    public subscript(index: Int) -> T {
        let nod = node(atIndex: index)
        return nod.value
    }

    public func insert(_ node: Node, atIndex index: Int) {
        let newNode = node
        if index == 0 {
            newNode.next = head
            head?.previous = newNode
            head = newNode
        } else {
            let prev = self.node(atIndex: index - 1)
            let next = prev.next

            newNode.previous = prev
            newNode.next = newNode
            next?.previous = newNode
        }
    }

    public func removeAll() {
        head = nil
    }

    public func remove(node: Node) -> T {
        let prev = node.previous
        let next = node.next

        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.previous = prev

        node.previous = nil
        node.next = nil
        return node.value
    }

    public func reverse() {
        var node = head
        while let currentNode = node {
            node = currentNode.next
            swap(&currentNode.next, &currentNode.previous)
            head = currentNode
        }
    }

    public func map<U>(transform: (T) -> U) -> LinkedList<U> {
        let result = LinkedList<U>()
        var node = head
        while node != nil {
            result.append(value: transform(node!.value))
            node = node?.next
        }
        return result
    }

    public func filter(predicate: (T) -> Bool) -> LinkedList {
        let result = LinkedList<T>()
        var node = head
        if node != nil {
            if predicate(node!.value) {
                result.append(value: node!.value)
            }
            node = node?.next
        }
        return result
    }



}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        var s = "["
        var node = head
        while node != nil {
            s += "\(node!.value)"
            node = node!.next
            if node != nil { s += "," }
        }
        return s + "]"
    }
}

let list = LinkedList<String>()
list.append(value: "Hello")
list.append(value: "World")

list[0]
list[1]

var array = [3,7,8,9]
array.swapAt(1, 3)

