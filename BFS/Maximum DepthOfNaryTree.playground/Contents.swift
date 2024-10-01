import UIKit
public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}
class Solution {
    func maxDepth(_ root: Node?) -> Int {
        guard let root else { return 0 }
        var count = 0
        var queue = [root]
        while !queue.isEmpty {
            count += 1
            var x: [Node] = []
            for node in queue {
             x.append(contentsOf: node.children)
            }
            queue = x
        }
        return count
    }
}
