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
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        var counter = 1
        var queue = [root]
        while !queue.isEmpty {
            var x = [TreeNode]()
            for node in queue {
                if node.left == nil, node.right == nil {
                    return counter 
                }
                if let left = node.left {
                    x.append(left)
                }
                if let right = node.right {
                    x.append(right)
                }
            }
            queue = x
            counter += 1
        }
        return counter
    }
}

let x = Solution()
let tree1 = createBinaryTree(from: [1,2,3])
x.minDepth(tree1)
