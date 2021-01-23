//
//  XCTContext+Parameterized.swift
//  TestExtSwift
//
//  Created by 和泉田 領一 on 2021/01/23.
//

import XCTest

import XCTest

public extension XCTContext {
    class func runActivity<Src, Result>(named name: String,
                                        src: Src,
                                        test: @escaping (XCTActivity, Src.Argument, Src.ExpectedResult) throws -> Result) rethrows where Src: SourcesProtocol {
        for (argument, expectedResult, _) in src.sources {
            _ = try XCTContext.runActivity(named: name) { activity in
                try test(activity, argument, expectedResult)
            }
        }
    }

    class func runActivity<Src, Result>(named name: String,
                                        src: Src,
                                        test: @escaping (XCTActivity, Src.Argument, Src.ExpectedResult, UInt) throws -> Result) rethrows where Src: SourcesProtocol, Src.Line == UInt {
        for (argument, expectedResult, line) in src.sources {
            _ = try XCTContext.runActivity(named: name) { activity in
                try test(activity, argument, expectedResult, line)
            }
        }
    }
}
