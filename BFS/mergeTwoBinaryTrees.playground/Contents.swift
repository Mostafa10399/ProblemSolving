import UIKit
public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init() { self.val = 0; self.left = nil; self.right = nil; }
     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
         self.left = left
         self.right = right
     }
 }
func createBinaryTree(from list: [Int?]) -> TreeNode? {
    guard !list.isEmpty, let firstVal = list[0] else { return nil }

    // Create an array of nodes based on the values (or nil for missing nodes)
    var nodes: [TreeNode?] = list.map { $0 != nil ? TreeNode($0!) : nil }

    // Link the nodes to form the tree
    for i in 0..<(list.count / 2) {
        if let node = nodes[i] {
            if 2 * i + 1 < list.count {
                node.left = nodes[2 * i + 1]
            }
            if 2 * i + 2 < list.count {
                node.right = nodes[2 * i + 2]
            }
        }
    }
    
    return nodes[0] // The root of the tree
}
class Solution {
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        if root1 == nil { return root2 }
        if root2 == nil { return root1 }
        var queue: [(TreeNode?, TreeNode?)] = [(root1, root2)]
        while !queue.isEmpty {
            let (node1, node2) = queue.removeFirst()
            node1!.val += node2!.val
            if let left1 = node1?.left, let left2 = node2?.left {
                queue.append((left1, left2))
            } else if node1?.left == nil {
                node1?.left = node2?.left
            }
            if let right1 = node1?.right, let right2 = node2?.right {
                queue.append((right1, right2))
            } else if node1?.right == nil {
                node1?.right = node2?.right
            }
        }
        return root1
    }
}

