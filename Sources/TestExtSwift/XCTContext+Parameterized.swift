//
//  XCTContext+Parameterized.swift
//  TestExtSwift
//
//  Created by 和泉田 領一 on 2021/01/23.
//

import XCTest

import XCTest

public extension XCTContext {
    class func runActivity<Src, Argument, Result>(named name: String,
                                                  _ src: Src,
                                                  setUp: (() throws -> ())? = .none,
                                                  test: @escaping (XCTActivity, Argument) throws -> Result) rethrows where Src: Sequence, Src.Element == Argument {
        for argument in src {
            _ = try XCTContext.runActivity(named: name) { activity -> Result in
                try setUp?()
                return try test(activity, argument)
            }
        }
    }
    
    class func runActivity<Src, Argument, Result>(named name: String,
                                                  _ src: Src,
                                                  setUp: (() throws -> ())? = .none,
                                                  test: @escaping (XCTActivity, Argument, UInt) throws -> Result) rethrows where Src: Sequence, Src.Element == (Argument, UInt) {
        for (argument, line) in src {
            _ = try XCTContext.runActivity(named: name) { activity -> Result in
                try setUp?()
                return try test(activity, argument, line)
            }
        }
    }
    
    class func runActivity<Argument, Result>(named name: String,
                                             @SourcesBuilder src: () -> [Argument],
                                             setUp: (() throws -> ())? = .none,
                                             test: @escaping (XCTActivity, Argument) throws -> Result) rethrows {
        for argument in src() {
            _ = try XCTContext.runActivity(named: name) { activity -> Result in
                try setUp?()
                return try test(activity, argument)
            }
        }
    }

    class func runActivity<Argument, Result>(named name: String,
                                             @SourcesBuilder src: () -> [(Argument, UInt)],
                                             setUp: (() throws -> ())? = .none,
                                             test: @escaping (XCTActivity, Argument, UInt) throws -> Result) rethrows {
        for (argument, line) in src() {
            _ = try XCTContext.runActivity(named: name) { activity -> Result in
                try setUp?()
                return try test(activity, argument, line)
            }
        }
    }

    class func runActivity<Src, Argument, ExpectedResult, Result>(named name: String,
                                                                  _ src: Src,
                                                                  setUp: (() throws -> ())? = .none,
                                                                  test: @escaping (XCTActivity, Argument, ExpectedResult) throws -> Result) rethrows where Src: Sequence, Src.Element == (Argument, ExpectedResult) {
        for (argument, expectedResult) in src {
            _ = try XCTContext.runActivity(named: name) { activity -> Result in
                try setUp?()
                return try test(activity, argument, expectedResult)
            }
        }
    }
    
    class func runActivity<Src, Argument, ExpectedResult, Result>(named name: String,
                                                                  _ src: Src,
                                                                  setUp: (() throws -> ())? = .none,
                                                                  test: @escaping (XCTActivity, Argument, ExpectedResult, UInt) throws -> Result) rethrows where Src: Sequence, Src.Element == (Argument, ExpectedResult, UInt) {
        for (argument, expectedResult, line) in src {
            _ = try XCTContext.runActivity(named: name) { activity -> Result in
                try setUp?()
                return try test(activity, argument, expectedResult, line)
            }
        }
    }
    
    class func runActivity<Argument, ExpectedResult, Result>(named name: String,
                                                             @SourcesBuilder src: () -> [(Argument, ExpectedResult)],
                                                             setUp: (() throws -> ())? = .none,
                                                             test: @escaping (XCTActivity, Argument, ExpectedResult) throws -> Result) rethrows {
        for (argument, expectedResult) in src() {
            _ = try XCTContext.runActivity(named: name) { activity -> Result in
                try setUp?()
                return try test(activity, argument, expectedResult)
            }
        }
    }
    
    class func runActivity<Argument, ExpectedResult, Result>(named name: String,
                                                             @SourcesBuilder _ src: () -> [(Argument, ExpectedResult, UInt)],
                                                             setUp: (() throws -> ())? = .none,
                                                             test: @escaping (XCTActivity, Argument, ExpectedResult, UInt) throws -> Result) rethrows {
        for (argument, expectedResult, line) in src() {
            _ = try XCTContext.runActivity(named: name) { activity -> Result in
                try setUp?()
                return try test(activity, argument, expectedResult, line)
            }
        }
    }
}
