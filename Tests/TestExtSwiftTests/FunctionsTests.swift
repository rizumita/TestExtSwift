//
//  FunctionsTests.swift
//  TestExtSwiftTests
//
//  Created by 和泉田 領一 on 2021/01/24.
//

import XCTest
@testable import TestExtSwift

class FunctionsTests: XCTestCase {
    func testSrc_tuples() throws {
        let result = src {
            (1, 1)
            (2, 2)
        }
        XCTAssertEqual(result[0].0, 1)
        XCTAssertEqual(result[0].1, 1)
        XCTAssertEqual(result[1].0, 2)
        XCTAssertEqual(result[1].1, 2)
    }
    
    func testSrc_arrays() throws {
        let result = src {
            [(1, 1)]
            [(2, 2)]
        }
        XCTAssertEqual(result[0].0, 1)
        XCTAssertEqual(result[0].1, 1)
        XCTAssertEqual(result[1].0, 2)
        XCTAssertEqual(result[1].1, 2)
    }

    func test_r_RowBuilder() throws {
        let row = r { 1; 2; 3 }
        XCTAssertEqual(row.value.0, 1)
        XCTAssertEqual(row.value.1, 2)
        XCTAssertEqual(row.value.2, 3)
    }

    static var allTests = [
        ("testSrc_tuples", testSrc_tuples),
        ("testSrc_arrays", testSrc_arrays),
    ]
}
