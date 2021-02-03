//
//  ECPOperatorsTests.swift
//  TestExtSwift
//
//  Created by 和泉田 領一 on 2021/02/03.
//
//

import XCTest
@testable import TestExtSwift

class ECPOperatorsTests: XCTestCase {

    func testECPOperator() throws {
        try (1...100) => {
            valid("Valid case")
            => { $0 % 4 == 0 }
            => { XCTAssertEqual($1 % 4, 0) }

            invalid("Invalid case", representative: 100, order: { $0 <= $1 })
            => relation { $0 % 4 != 0 }
            => test { XCTAssertNotEqual($1 % 4, 0) }
        }
    }

    static var allTests = [
        ("testECPOperator", testECPOperator),
    ]

}
