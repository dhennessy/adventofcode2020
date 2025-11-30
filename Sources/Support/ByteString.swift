import Foundation

struct ByteString: CustomStringConvertible, Equatable {
    let data: [UInt8]

    var count: Int {
        data.count
    }
    
    var description: String {
        String(bytes: data, encoding: .ascii)!
    }

    var isEmpty: Bool {
        data.isEmpty
    }
    
    init() {
        self.data = []
    }
    
    init(_ data: [UInt8]) {
        self.data = data
    }

    init(_ str: String) {
        self.data = str.compactMap { $0.asciiValue }
    }
}
