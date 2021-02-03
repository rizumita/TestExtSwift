//
//  EquivalenceClassPartitionTests.swift
//  TestExtSwift
//
//  Created by 和泉田 領一 on 2021/02/03.
//
//

import XCTest
@testable import TestExtSwift

class EquivalenceClassPartitionTests: XCTestCase {

    func testValid() throws {
        let p = EquivalenceClassPartition<Data, ()>.valid(name: "valid",
                                                          relation: { _ -> Bool in true },
                                                          test: { _, _ -> () in })
        XCTAssertNil(p.boundary)
    }

    func testInvalid() throws {
        let p = EquivalenceClassPartition<Data, ()>.invalid(name: "invalid",
                                                            relation: { _ -> Bool in true },
                                                            test: { _, _ -> () in })
        XCTAssertNil(p.boundary)
    }

    func testValid_Comparable() throws {
        let p = EquivalenceClassPartition<Int, ()>.valid(name: "valid",
                                                          relation: { _ -> Bool in true },
                                                          test: { _, _ -> () in })
        XCTAssertNotNil(p.boundary)
    }

    func testInvalid_Comparable() throws {
        let p = EquivalenceClassPartition<Int, ()>.invalid(name: "invalid",
                                                            relation: { _ -> Bool in true },
                                                            test: { _, _ -> () in })
        XCTAssertNotNil(p.boundary)
    }

    func testSelect() throws {
        let p = EquivalenceClassPartition<Int, ()>.valid(name: "select",
                                                           relation: { $0 % 2 == 1 },
                                                           test: { _, _ -> () in })
        let values = try p.select(from: 1...999)
        XCTAssertTrue(values.contains(1))
        XCTAssertTrue(values.contains(999))
        XCTAssertEqual(values.count, 102)
    }

    static var allTests = [
        ("testValid", testValid),
        ("testInvalid", testInvalid),
        ("testValid_Comparable", testValid_Comparable),
        ("testInvalid_Comparable", testInvalid_Comparable),
    ]

}
