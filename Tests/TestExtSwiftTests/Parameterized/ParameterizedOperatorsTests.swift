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
        try
        {
            r { 1; 3; false }
            r { 2; 3; true }
            r { 3; 3; false }
        } => Parameterized("Parameterized Testing")
            .before { p1, p2, p3 in print("before") }
            .after { p1, p2, p3 in print("after") }
            .test { _, p1, p2, p3, line in
                XCTAssertEqual(p1 + 1 == p2, p3, line: line)
            }
    }

    func testParam_Rows() throws {
        try
        [r { 1; 3; false },
         r { 2; 3; true },
         r { 3; 3; false }] => Parameterized("Parameterized Testing")
            .test { _, p1, p2, p3, line in
                XCTAssertEqual(p1 + 1 == p2, p3, line: line)
            }
    }

    func testParam_Seq() throws {
        try
        [1, 2, 3] => Parameterized("Parameterized Testing")
            .test { _, p in XCTAssertEqual(p, p) }
    }

    func testParam_Product() throws {
        enum A: CaseIterable {
            case a1, a2
        }

        enum B: CaseIterable {
            case b1, b2
        }

        try A.allCases ** B.allCases =>
            Parameterized("Parameterized Testing")
                .test { (_, a, b: B) in
                    print(a)
                    print(b)
                }
    }

    static var allTests = [
        ("testParam", testParam),
        ("testParam_Rows", testParam_Rows),
        ("testParam_Seq", testParam_Seq),
        ("testParam_Product", testParam_Product),
    ]

}
