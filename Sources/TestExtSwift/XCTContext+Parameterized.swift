//
//  XCTContext+Parameterized.swift
//  TestExtSwift
//
//  Created by 和泉田 領一 on 2021/01/23.
//

import XCTest

import XCTest

extension XCTContext {
    public class func runActivity<Argument, ExpectedResult, Result>(named name: String,
                                                                    @SourcesBuilder sources: () -> [(Argument, ExpectedResult)],
                                                                    test: @escaping (XCTActivity, Argument, ExpectedResult) throws -> Result) rethrows {
        for (argument, expectedResult) in sources() {
            _ = try XCTContext.runActivity(named: name) { activity in
                try test(activity, argument, expectedResult)
            }
        }
    }

    public class func runActivity<Argument, ExpectedResult, Result>(named name: String,
                                                                    @SourcesBuilder sources: () -> [(Argument, ExpectedResult, UInt)],
                                                                    test: @escaping (XCTActivity, Argument, ExpectedResult, UInt) throws -> Result) rethrows {
        for (argument, expectedResult, line) in sources() {
            _ = try XCTContext.runActivity(named: name) { activity in
                try test(activity, argument, expectedResult, line)
            }
        }
    }
}

public func s<Argument, ExpectedResult>(_ argument: Argument, _ expectedResult: ExpectedResult, _ line: UInt = #line) -> (Argument, ExpectedResult, UInt) {
    (argument, expectedResult, line)
}
