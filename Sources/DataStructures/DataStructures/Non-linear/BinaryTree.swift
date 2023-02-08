//
//  BinaryTree.swift
//  
//
//  Created by Mauricio Chirino on 20/1/23.
//

import Foundation

/// Binary tree implementation for any type of numeric value
public final class BinaryTree<T: Numeric & Comparable>: TreeVisitable {
    public var visitedNode: (TreeNode<T>) -> Void

    public var count: Int

    /// Tree's root node
    var root: TreeNode<T>?

    /// Default initialization
    /// - Parameter visitNode: closure that handles every visited node in the tree visitable methods. Defaults to `print` the current node's value
    public init(visitNode: @escaping (TreeNode<T>) -> Void = { currentNode in
        print(currentNode.value)
    }) {
        count = 0
        self.visitedNode = visitNode
    }

    /// Inserts values in a left-most orderly fashion
    /// - Parameter newValue: numeric value to be added
    public func insert(_ newValue: T) {
        let newNode = TreeNode(newValue)

        if root == nil {
            root = newNode
            count += 1

            return
        }

        var current = root

        while true {
            if newValue < current!.value {
                if current?.left == nil {
                    current?.left = newNode
                    count += 1

                    break
                } else {
                    current = current?.left
                }
            } else {
                if current?.right == nil {
                    current?.right = newNode
                    count += 1

                    break
                } else {
                    current = current?.right
                }
            }
        }
    }
}

extension BinaryTree: DataStructurable {
    public var isEmpty: Bool {
        return root == nil
    }

    public func peek() -> T? {
        return root?.value
    }
}
