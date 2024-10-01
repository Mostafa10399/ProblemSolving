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
func createBinaryTree(_ list: [Int?]) -> TreeNode? {
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
    func isUnivalTree(_ root: TreeNode?) -> Bool {
        guard let root else { return true }
        var queue = [root]
        while !queue.isEmpty {
            let first = queue.removeFirst()
            if let left = first.left {
                if left.val != first.val {
                    return false
                } else {
                    queue.append(left)
                }
            }
            if let right = first.right {
                if right.val != first.val {
                    return false
                } else {
                    queue.append(right)
                }
            }
            
            
        }
        return true
    }
}

let binaryTree = createBinaryTree([2,2,2,5,2])
let x = Solution()
x.isUnivalTree(binaryTree)
