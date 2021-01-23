//
//  XCTContext+Parameterized.swift
//  TestExtSwift
//
//  Created by 和泉田 領一 on 2021/01/23.
//

import XCTest

import XCTest

public extension XCTContext {
    class func runActivity<Src, Argument, ExpectedResult, Result>(named name: String,
                                                                  src: Src,
                                                                  test: @escaping (XCTActivity, Argument, ExpectedResult) throws -> Result) rethrows where Src: SourcesProtocol, Src.Source == (Argument, ExpectedResult) {
        for (argument, expectedResult) in src.sources {
            _ = try XCTContext.runActivity(named: name) { activity in
                try test(activity, argument, expectedResult)
            }
        }
    }
    
    class func runActivity<Src, Argument, ExpectedResult, Result>(named name: String,
                                                                  src: Src,
                                                                  test: @escaping (XCTActivity, Argument, ExpectedResult, UInt) throws -> Result) rethrows where Src: SourcesProtocol, Src.Source == (Argument, ExpectedResult, UInt) {
        for (argument, expectedResult, line) in src.sources {
            _ = try XCTContext.runActivity(named: name) { activity in
                try test(activity, argument, expectedResult, line)
            }
        }
    }
}
