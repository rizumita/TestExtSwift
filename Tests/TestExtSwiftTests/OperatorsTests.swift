//
//  OperatorsTests.swift
//  TestExtSwiftTests
//
//  Created by 和泉田 領一 on 2021/01/23.
//

import XCTest
@testable import TestExtSwift

class OperatorsTests: XCTestCase {
    
    func testDirectProduct() throws {
        let dp1 = (1 ** 1).flatMap { [$0.0, $0.1] }
        XCTAssertEqual(dp1, [1, 1])

        let dp2 = (1 ** [1, 2]).flatMap { [$0.0, $0.1] }
        XCTAssertEqual(dp2, [1, 1, 1, 2])
        
        let dp3 = ([1, 2] ** 1).flatMap { [$0.0, $0.1] }
        XCTAssertEqual(dp3, [1, 1, 2, 1])
        
        let dp4 = ([1, 2] ** [3, 4]).flatMap { [$0.0, $0.1] }
        XCTAssertEqual(dp4, [1, 3, 1, 4, 2, 3, 2, 4])
    }

    static var allTests = [
        ("testExample", testDirectProduct),
    ]
}
