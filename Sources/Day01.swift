import Algorithms

struct Day01: AdventDay {
    var data: String

    var entities: [Int] {
        data.split(separator: "\n").compactMap { Int($0) }
    }

    func part1() -> Any {
        for a in entities {
            let b = 2020-a
            if entities.contains(b) {
                return a*b
            }
        }
        return 0
    }

    func part2() -> Any {
        for (i, a) in entities.enumerated() {
            for b in entities[i+1..<entities.count] {
                let c = 2020-(a+b)
                if entities.contains(c) {
                    return a*b*c
                }
            }
        }
        return 0
    }
}
