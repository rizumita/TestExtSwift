import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    [
        testCase(OperatorsTests.allTests),
        testCase(FunctionsTests.allTests),
        testCase(XCTContext_ParameterizedTests.allTests),
        testCase(XCTContext_ECPTests.allTests),
    ]
}
#endif
