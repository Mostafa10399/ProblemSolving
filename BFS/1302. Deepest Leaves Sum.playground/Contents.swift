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
func printTreeNodeValues(_ nodes: [TreeNode]) {
    for node in nodes {
            print(node.val)
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
    func deepestLeavesSum(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        var queue = [root]
        var total = root.val
        while !queue.isEmpty {
            var q = [TreeNode]()
            var t = 0
            for node in queue {
                if let left = node.left {
                    t += left.val
                    q.append(left)
                }
                if let right = node.right {
                    t += right.val
                    q.append(right)
                }
            }
            if !q.isEmpty {
                total = t
            }
            queue = q            
        }
        return total
    }
}

let x = Solution()
let tree1 = createBinaryTree(from: [1,2,3,4,5,nil,6,7,nil,nil,nil,nil,8])
x.deepestLeavesSum(tree1)
