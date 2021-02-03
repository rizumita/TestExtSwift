//
//  XCTContext+ECPTests.swift
//  TestExtSwift
//
//  Created by 和泉田 領一 on 2021/02/01.
//
//

import XCTest
import TestExtSwift

class XCTContext_ECPTests: XCTestCase {

    func testECP() throws {
        try XCTContext.runActivity(
            values: 1...100,
            partitions: .valid(name: "Valid case") { $0 % 4 == 0 } test: { _, value in
                XCTAssertEqual(value % 2, 0)
            },
            .invalid(name: "Invalid case1") { $0 % 4 != 0 } test: { _, value in
                XCTAssertNotEqual(value % 4, 0)
            },
            .invalid(name: "Invalid case2",
                     representative: 1,
                     boundary: { (value1: Int, value2: Int) in value1 < value2 },
                     relation: { (value: Int) in value == 100 },
                     test: { (_, value: Int) in XCTAssertEqual(value, 100) })
        )
    }

    static var allTests = [
        ("testECP", testECP),
    ]

}
