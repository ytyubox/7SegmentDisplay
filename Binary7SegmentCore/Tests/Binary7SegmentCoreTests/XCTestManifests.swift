import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Binary7SegmentCoreTests.allTests),
    ]
}
#endif
