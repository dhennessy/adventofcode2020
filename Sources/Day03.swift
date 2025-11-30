import Algorithms

struct Day03: AdventDay {
    let map: Grid
    
    init(data: String) {
        map = Grid(data)
    }

    func countTrees(dx: Int, dy: Int) -> Int {
        var nTrees = 0
        var x = 0
        var y = 0
        while y < map.height {
            if map.valueAt(x, y) == "#" {
                nTrees += 1
            }
            x = (x + dx) % map.width
            y = y + dy
        }
        return nTrees
    }
    
    func part1() -> Any {
        countTrees(dx: 3, dy: 1)
    }

    func part2() -> Any {
        var total = 1
        for (dx, dy) in [(1, 1), (3, 1), (5, 1), (7, 1), (1, 2)] {
            total *= countTrees(dx: dx, dy: dy)
        }
        return total
    }
}
