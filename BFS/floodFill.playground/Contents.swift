import UIKit
class Solution {
    struct Point: Hashable {
      let x: Int
      let y: Int
    }

    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        let oldColor = image[sr][sc]
        if oldColor == newColor { return image }
        var result = image
        var queue = [(Int, Int)]()
        var visitedLands: Set<Point> = []
        queue.append((sr, sc))

        while !queue.isEmpty {
            let (row, col) = queue.removeFirst()
            visitedLands.insert(Point(x: row, y: col))
            if !checkRange(result, Point(x: row, y: col)) { continue }
            if result[row][col] != oldColor { continue }
            result[row][col] = newColor
            if !visitedLands.contains(Point(x: row, y: col - 1)) {
                queue.append((row, col - 1))
            }
            if !visitedLands.contains(Point(x: row + 1, y: col)) {
                queue.append((row + 1, col))
            }
            if !visitedLands.contains(Point(x: row, y: col + 1)) {
                queue.append((row, col + 1))
            }
            if !visitedLands.contains(Point(x: row - 1, y: col)) {
                queue.append((row - 1, col))
            }
        }

        return result
    }
    
    func checkRange(_ grid: [[Int]], _ point: Point) -> Bool {
        return  (point.x >= 0 && point.x < grid.count && point.y >= 0 && point.y < grid[0].count)
    }
}
