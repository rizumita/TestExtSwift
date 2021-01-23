//
//  XCTContextI+ParameterizedTests.swift
//  TestExtSwiftTests
//
//  Created by 和泉田 領一 on 2021/01/23.
//

import XCTest
@testable import TestExtSwift

class XCTContext_ParameterizedTests: XCTestCase {
    func testRunActivity_tuples() {
        var tuples = [(1, 1), (2, 2)]
        XCTContext.runActivity(named: "Tuples") {
            (1, 1)
            (2, 2)
        } test: { (_, arg, expected) in
            let tuple = tuples.removeFirst()
            XCTAssertEqual(tuple.0, arg)
            XCTAssertEqual(tuple.1, expected)
        }
    }
    
    func testRunActivity_arrays() {
        var tuples = [(1, 1), (2, 2)]
        XCTContext.runActivity(named: "Arrays") {
            [(1, 1)]
            [(2, 2)]
        } test: { (_, arg, expected) in
            let tuple = tuples.removeFirst()
            XCTAssertEqual(tuple.0, arg)
            XCTAssertEqual(tuple.1, expected)
        }

    }
    
    static var allTests = [
        ("testRunActivity_tuples", testRunActivity_tuples),
        ("testRunActivity_arrays", testRunActivity_tuples),
    ]
}
