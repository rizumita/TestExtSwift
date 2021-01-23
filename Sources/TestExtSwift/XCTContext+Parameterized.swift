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
                                                                  _ src: Src,
                                                                  _ test: @escaping (XCTActivity, Argument, ExpectedResult) throws -> Result) rethrows where Src: Sequence, Src.Element == (Argument, ExpectedResult) {
        for (argument, expectedResult) in src {
            _ = try XCTContext.runActivity(named: name) { activity in
                try test(activity, argument, expectedResult)
            }
        }
    }
    
    class func runActivity<Src, Argument, ExpectedResult, Result>(named name: String,
                                                                  _ src: Src,
                                                                  _ test: @escaping (XCTActivity, Argument, ExpectedResult, UInt) throws -> Result) rethrows where Src: Sequence, Src.Element == (Argument, ExpectedResult, UInt) {
        for (argument, expectedResult, line) in src {
            _ = try XCTContext.runActivity(named: name) { activity in
                try test(activity, argument, expectedResult, line)
            }
        }
    }
    
    class func runActivity<Argument, ExpectedResult, Result>(named name: String,
                                                             @SourcesBuilder _ src: () -> [(Argument, ExpectedResult)],
                                                             _ test: @escaping (XCTActivity, Argument, ExpectedResult) throws -> Result) rethrows {
        for (argument, expectedResult) in src() {
            _ = try XCTContext.runActivity(named: name) { activity in
                try test(activity, argument, expectedResult)
            }
        }
    }
    
    class func runActivity<Argument, ExpectedResult, Result>(named name: String,
                                                             @SourcesBuilder _ src: () -> [(Argument, ExpectedResult, UInt)],
                                                             _ test: @escaping (XCTActivity, Argument, ExpectedResult, UInt) throws -> Result) rethrows {
        for (argument, expectedResult, line) in src() {
            _ = try XCTContext.runActivity(named: name) { activity in
                try test(activity, argument, expectedResult, line)
            }
        }
    }
}
