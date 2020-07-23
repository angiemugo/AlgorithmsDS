import UIKit

var str = "Hello, playground"

// a binary tree is a tree where the each node has 0,1,2 children. if a node doesn't have any children it is called a leaf node

public indirect enum BinaryTree<T> {
    case node(BinaryTree)
}
