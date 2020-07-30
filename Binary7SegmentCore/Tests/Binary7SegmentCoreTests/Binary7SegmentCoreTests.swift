import XCTest
@testable import Binary7SegmentCore

final class Binary7SegmentCoreTests: XCTestCase {
    fileprivate func testValue(_ list: [Int], _ expect: Int) {
        var byte = Byte()
        byte.changeTo(list.booled())
        XCTAssertEqual(byte.value, expect,"\(list) expect \(expect), but found \(byte.value)")
        byte.reset()
    }
    
    func testGetValue() {
        let testList = [
            ([0,0,0,0], 0),
            ([0,0,0,1], 1),
            ([0,0,1,0], 2),
            ([0,0,1,1], 3),
            ([0,1,0,0], 4),
            ([0,1,0,1], 5),
            ([0,1,1,0], 6),
            ([0,1,1,1], 7),
            ([1,0,0,0], 8),
            ([1,0,0,1], 9),
        ]
        for (list, expect) in testList {
        testValue(list, expect)
        }
    }

    static var allTests = [
        ("testGetValue", testGetValue),
    ]
}

extension Array where Element == Int {
    func booled() -> [Bool] {
        map{$0 != 0}
    }
}
