import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(TestExtSwiftTests.allTests),
    ]
}
#endif
