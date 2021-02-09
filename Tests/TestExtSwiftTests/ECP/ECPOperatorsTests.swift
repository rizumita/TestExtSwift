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
        try (1...100) => ECP("ECP Testing") {
            Valid("Valid case")
                .relation { $0 % 4 == 0 }
                .test { XCTAssertEqual($1 % 2, 0) }

            Invalid("Invalid case 1")
                .relation { $0 % 4 != 0 }
                .test { XCTAssertNotEqual($1 % 4, 0) }

            Invalid("Invalid case 2")
                .representative(1)
                .order { $0 < $1 }
                .relation { $0 == 100 }
                .test { XCTAssertEqual($1, 100) }
        }
    }

    static var allTests = [
        ("testECPOperator", testECPOperator),
    ]

}
