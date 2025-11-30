import Testing

@testable import AdventOfCode

struct ByteStringTests {

    @Test func initEmpty() async throws {
        let bs = ByteString()
        #expect(bs.isEmpty)
        #expect(bs.count == 0)
        #expect(bs.description == "")
    }

    @Test func initFromBytes() async throws {
        let bs = ByteString([0x31, 0x32, 0x33, 0x34, 0x35])
        #expect(!bs.isEmpty)
        #expect(bs.count == 5)
//        #expect(bs == "12345")
        #expect(bs.description == "12345")
    }

    @Test func initFromString() async throws {
        let bs = ByteString("12345")
        #expect(bs.count == 5)
        #expect(bs.description == "12345")
    }

    @Test func equality() async throws {
        #expect(ByteString() == ByteString())
        #expect(ByteString("12345") == ByteString("12345"))
        #expect(ByteString("12345") == ByteString([0x31, 0x32, 0x33, 0x34, 0x35]))
    }
}
