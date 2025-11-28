import Algorithms

extension String {
    func charAt(_ index: Int) -> Character {
        self[self.index(self.startIndex, offsetBy: index)]
    }
}

struct Policy {
    let lower: Int
    let upper: Int
    let character: Character
    let password: String
    
    var isValid1: Bool {
        let count = password.filter({ $0 == character}).count
        return count >= lower && count <= upper
    }
    
    var isValid2: Bool {
        var count = 0
        if password.charAt(lower-1) == character {
            count += 1
        }
        if password.charAt(upper-1) == character {
            count += 1
        }
        return count == 1
    }
}

struct Day02: AdventDay {
    var data: String

    // 1-3 a: abcde

    var entities: [Policy] {
        data.split(separator: "\n").map { line in
            let policyPart = line.split(separator: ": ")[0]
            let passwordPart = line.split(separator: ": ")[1]
            let bounds = policyPart.split(separator: "-").map { value in
                Int(value.filter({ $0.isNumber }))!
            }
            let character = policyPart.split(separator: " ").last!.first!
            return Policy(lower: bounds[0], upper: bounds[1], character: character, password: String(passwordPart))
        }
    }

    func part1() -> Any {
        entities.filter({$0.isValid1}).count
    }

    func part2() -> Any {
        entities.filter({$0.isValid2}).count
    }
}
