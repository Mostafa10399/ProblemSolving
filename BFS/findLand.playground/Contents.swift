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
    struct Point: Hashable {
      let x: Int
      let y: Int
    }
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var result = 0
       
        for i in 0 ..< grid.count {
            for j in 0 ..< grid[0].count {
//                visited.insert(Point(x: i, y: j) )
                if grid[i][j] == 1 {
                    return findLand(grid, Point(x: i, y: j))
                }
            }
        }
        return 0
    }
    
    func findLand(_ grid: [[Int]], _ point: Point) -> Int {
        var visited: Set<Point> = []
        var result = 0
        var queue: [Point] = [point]
        while !queue.isEmpty {
            let current = queue.removeFirst()
            if visited.contains(current) { continue }
            visited.insert(current)
            if grid[current.x][current.y] == 1 {
                result += 4
            }
            if checkRange(grid, Point(x: current.x, y: current.y - 1)), grid[current.x][current.y - 1] == 1 {
                queue.append(Point(x: current.x, y: current.y - 1))
                result -= 1
            }
            if checkRange(grid, Point(x: current.x + 1, y: current.y)), grid[current.x + 1][current.y] == 1 {
                queue.append(Point(x: current.x + 1, y: current.y))
                result -= 1
            }
            
            if checkRange(grid, Point(x: current.x, y: current.y + 1)), grid[current.x][current.y + 1] == 1 {
                queue.append(Point(x: current.x, y: current.y + 1))
                result -= 1
            }
            
            if checkRange(grid, Point(x: current.x - 1, y: current.y)), grid[current.x-1][current.y] == 1 {
                queue.append(Point(x: current.x - 1, y: current.y))
                result -= 1
            }
            
        }
        
        return result
    }
    
    
    func checkRange(_ grid: [[Int]], _ point: Point) -> Bool {
        return  (point.x >= 0 && point.x < grid.count && point.y >= 0 && point.y < grid[0].count)
    }
}


let x = Solution()
let c =  x.islandPerimeter( [[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]])
