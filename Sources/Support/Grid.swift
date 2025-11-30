import Foundation

struct Grid {
    var storage: [[String]] = []
    var width: Int
    var height: Int
    
    init(_ data: String) {
        width = 0
        height = 0
        storage = data.split(separator: "\n").map {
            width = $0.count
            return $0.map { String($0) }
        }
        height = storage.count
    }
    
    func valueAt(_ x: Int, _ y: Int) -> String? {
        storage[y][x]
    }
}
