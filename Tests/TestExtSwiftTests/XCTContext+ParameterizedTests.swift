//
//  XCTContextI+ParameterizedTests.swift
//  TestExtSwiftTests
//
//  Created by 和泉田 領一 on 2021/01/23.
//

import XCTest
@testable import TestExtSwift

class XCTContext_ParameterizedTests: XCTestCase {
    func testRunActivity_tuples() throws {
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

    func testRunActivity_arrays() throws {
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
    
    func testRunActivity_lined() throws {
        var tuples = [(1, 1), (2, 2)]
        XCTContext.runActivity(named: "Arrays", {
            s(1, 1)
            s(2, 2)
        }) { (_, arg, expected, line) in
            let tuple = tuples.removeFirst()
            XCTAssertEqual(tuple.0, arg, line: line)
            XCTAssertEqual(tuple.1, expected, line: line)
        }
    }

    func testRunActivity_array() throws {
        var tuples = [(1, 1), (2, 2)]
        XCTContext.runActivity(named: "Array", [
            s(1, 1),
            s(2, 2)
        ]) { (_, arg, expected, line) in
            let tuple = tuples.removeFirst()
            XCTAssertEqual(tuple.0, arg, line: line)
            XCTAssertEqual(tuple.1, expected, line: line)
        }
    }

    func testRunActivity_setUp() throws {
        XCTContext.runActivity(named: "setUp", [
            s(1, 1),
            s(2, 2)
        ]) { arg in
            print("setUp: \(arg)")
        } test: { (_, arg, expected, line) in }
    }

    static var allTests = [
        ("testRunActivity_tuples", testRunActivity_tuples),
        ("testRunActivity_arrays", testRunActivity_tuples),
        ("testRunActivity_lined", testRunActivity_lined),
        ("testRunActivity_array", testRunActivity_array),
        ("testRunActivity_setUp", testRunActivity_setUp),
    ]
}
