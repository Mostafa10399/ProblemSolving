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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        var queue = [(p, q)]
        while !queue.isEmpty {
            let (firstTree, secondTree) = queue.removeFirst()
            if secondTree?.val != firstTree?.val {
                return false
            }
            if let firstTree = firstTree, let secondTree = secondTree {
                queue.append((firstTree.left, secondTree.left))
                queue.append((firstTree.right, secondTree.right))
            }
        }
        
        return true
    }
}

let x = Solution()
let tree1 = createBinaryTree(from: [1,2,3])
let tree2 = createBinaryTree(from: [1,2,3])
x.isSameTree(tree1, tree2)
