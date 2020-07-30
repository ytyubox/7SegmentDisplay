import XCTest
import Binary7SegmentCore

final class Binary7SegmentCoreTests: XCTestCase {
    fileprivate func testValue(_ list: Int, _ expect: Int) {
        var byte = Byte()
        byte.changeTo(list.boolList(count: 4))
        XCTAssertEqual(byte.value, expect,"\(list) expect \(expect), but found \(byte.value)")
    }
    
    func testGetValue() {
        let testList = [
            (0000, 0),
            (0001, 1),
            (0010, 2),
            (0011, 3),
            (0100, 4),
            (0101, 5),
            (0110, 6),
            (0111, 7),
            (1000, 8),
            (1001, 9),
        ]
        
        for (list, expect) in testList {
        testValue(list, expect)
        }
    }
    func testOrList() {
        let testList = [
            (0000, 010100000, 1111110),
            (0001, 000000000, 0110000),
            (0010, 010011000, 1101101),
            (0011, 001001000, 1111001),
            (0100, 000100011, 0110011),
            (0101, 100000110, 1011011),
            (0110, 000010001, 1011111),
            (0111, 101000000, 1110000),
            (1000, 010100000, 1111111),
            (1001, 000000000, 1111011),
        ]
        
        for (list, expect1, expect2) in testList {
            var byte = Byte()
            byte.changeTo(list.boolList(count: 4))
            let byteCircuits = ByteCirCuits(byte: byte)
            XCTAssertEqual(byteCircuits.andList.count, 9)
            XCTAssertEqual(byteCircuits.orList.count, 7)
            XCTAssertEqual(
                expect1.boolList(count: 9), byteCircuits.andList
            )
            XCTAssertEqual(expect2.boolList(count: 7), byteCircuits.orList, "\(list) expected \(expect2.boolList(count: 7)) but found \(byteCircuits.orList)")
        }
        
    }
    func testIntToBoolList() {
        let list = [ (0000,[0,0,0,0]),
                     (0001,[0,0,0,1]),
                     (0010,[0,0,1,0]),
                     (0011,[0,0,1,1]),
                     (0100,[0,1,0,0]),
                     (0101,[0,1,0,1]),
                     (0110,[0,1,1,0]),
                     (0111,[0,1,1,1]),
                     (1000,[1,0,0,0]),
                     (1001,[1,0,0,1])]
        for i in list {
            let result = i.0.boolList(count: 4)
            let expect = i.1
            XCTAssertEqual(result, expect.booled())
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

extension Int {
    func boolList(count:Int) -> [Bool] {
        var copy = self
        var re = [Bool]()
        while copy > 0 {
            re.append(copy % 10 == 0 ? false : true)
            copy /= 10
        }
        while re.count < count {
            re.append(false)
        }
        return re.reversed()
    }
}
