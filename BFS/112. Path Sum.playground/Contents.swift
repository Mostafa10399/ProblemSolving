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
func levelOrderTraversal(_ root: TreeNode?) {
    guard let root = root else { return }

    var queue: [TreeNode] = [root]
    while !queue.isEmpty {
        let currentNode = queue.removeFirst()
        print(currentNode.val, terminator: " ")

        if let leftNode = currentNode.left {
            queue.append(leftNode)
        }
        if let rightNode = currentNode.right {
            queue.append(rightNode)
        }
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
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root else { return false }
        if root.left == nil, root.right == nil { return root.val == targetSum }
        var queue = [(root.val, root)]
        while !queue.isEmpty {
            var q = [(Int,TreeNode)]()
            for node in queue {
                if let left = node.1.left {
                    let total = node.0 + left.val
                    if total == targetSum, left.left == nil, left.right == nil { return true }
                    q.append((total, left))
                    
                }
                if let right = node.1.right {
                    let total = node.0 + right.val
                    if total == targetSum, right.left == nil, right.right == nil { return true }
                    q.append((node.0 + right.val,right))
                }
            }
            queue = q
        }
        
        return false
    }
}

let x = Solution()
let tree1 = createBinaryTree(from: [5,4,8,11,nil,13,4,7,2,nil,nil,nil,1])
x.hasPathSum(tree1, 90)
