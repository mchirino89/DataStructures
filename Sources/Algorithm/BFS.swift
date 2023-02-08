//
//  BFS.swift
//  
//
//  Created by Mauricio Chirino on 8/2/23.
//

import Foundation

/// Bread-first search algorithm implementation
public struct BFS<T> {
    /// Searches in a _BFS_ fashion
    /// - Parameters:
    ///   - startingNode: root node to start the search from
    ///   - visitNode: closure function to execute on each visited node
    public static func search(from startingNode: GraphNode<T>, visitNode: @escaping (GraphNode<T>) -> Void) {
        let queue = Queue<GraphNode<T>>()
        startingNode.isVisited = true
        queue.enqueue(startingNode)

        while let currentNode = queue.dequeue() {
            visitNode(currentNode)

            for neighbor in currentNode.neighbors where !neighbor.isVisited {
                neighbor.isVisited = true
                queue.enqueue(neighbor)
            }
        }
    }
}