//
//  ParameterizedOperatorsTests.swift
//  TestExtSwift
//
//  Created by 和泉田 領一 on 2021/02/04.
//
//

import XCTest
@testable import TestExtSwift

class ParameterizedOperatorsTests: XCTestCase {

    func testParam() throws {
        try [^{ 1; 3; false },
             ^{ 2; 3; true },
             ^{ 3; 3; false }]
            => param("Parameterized Testing")
            - before { p1, p2, p3 in print("before"); print(p1); print(p2); print(p3) }
            - test { (_, p1: Int, p2: Int, p3: Bool, line) in
            XCTAssertEqual(p1 + 1 == p2, p3, line: line)
        }
            - after { p1, p2, p3 in print("after"); print(p1); print(p2); print(p3) }
    }

    func testParam_FunctionBuilder() throws {
        try {
                ^{ 1; 3; false }
                ^{ 2; 3; true }
                ^{ 3; 3; false }
            }
            => param("Parameterized Testing")
            - before { p1, p2, p3 in print("before"); print(p1); print(p2); print(p3) }
            - test { (_, p1: Int, p2: Int, p3: Bool, line) in XCTAssertEqual(p1 + 1 == p2, p3, line: line) }
            - after { p1, p2, p3 in print("after"); print(p1); print(p2); print(p3) }
    }

    static var allTests = [
        ("testParam", testParam),
        ("testParam_FunctionBuilder", testParam_FunctionBuilder),
    ]

}
