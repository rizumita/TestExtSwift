//
// Created by 和泉田 領一 on 2021/02/05.
//

import Foundation
import XCTest

public typealias Parameterized = ParameterizedTesting

public class ParameterizedTesting<Params> {
    let name: String
    var before: (Params) throws -> () = { _ in }
    var after: (Params) throws -> () = { _ in }

    public init(_ name: String) { self.name = name }

    public func before(_ b: @escaping (Params) throws -> ()) -> Self {
        before = b
        return self
    }

    public func after(_ a: @escaping (Params) throws -> ()) -> Self {
        after = a
        return self
    }

    public func test<Result>(_ t: @escaping (XCTActivity, Params) throws -> Result) -> ParameterizedTestingReady<Params, Result, WithoutLine> {
        ParameterizedTestingReady(name: name, before: before, after: after, test: { activity, params in
            try t(activity, params)
        })
    }

    public func test<A, B, Result>(_ t: @escaping (XCTActivity, A, B) throws -> Result) -> ParameterizedTestingReady<Params, Result, WithoutLine> where Params == (A, B) {
        ParameterizedTestingReady(name: name, before: before, after: after, test: { activity, params in
            try t(activity, params.0, params.1)
        })
    }

    public func test<A, B, C, Result>(_ t: @escaping (XCTActivity, A, B, C) throws -> Result) -> ParameterizedTestingReady<Params, Result, WithoutLine> where Params == (A, B, C) {
        ParameterizedTestingReady(name: name, before: before, after: after, test: { activity, params in
            try t(activity, params.0, params.1, params.2)
        })
    }

    public func test<A, B, C, D, Result>(_ t: @escaping (XCTActivity, A, B, C, D) throws -> Result) -> ParameterizedTestingReady<Params, Result, WithoutLine> where Params == (A, B, C, D) {
        ParameterizedTestingReady(name: name, before: before, after: after, test: { activity, params in
            try t(activity, params.0, params.1, params.2, params.3)
        })
    }

    public func test<A, B, C, D, E, Result>(_ t: @escaping (XCTActivity, A, B, C, D, E) throws -> Result) -> ParameterizedTestingReady<Params, Result, WithoutLine> where Params == (A, B, C, D, E) {
        ParameterizedTestingReady(name: name, before: before, after: after, test: { activity, params in
            try t(activity, params.0, params.1, params.2, params.3, params.4)
        })
    }

    public func test<A, B, C, D, E, F, Result>(_ t: @escaping (XCTActivity, A, B, C, D, E, F) throws -> Result) -> ParameterizedTestingReady<Params, Result, WithoutLine> where Params == (A, B, C, D, E, F) {
        ParameterizedTestingReady(name: name, before: before, after: after, test: { activity, params in
            try t(activity, params.0, params.1, params.2, params.3, params.4, params.5)
        })
    }

    public func test<Result>(_ t: @escaping (XCTActivity, Params, UInt) throws -> Result) -> ParameterizedTestingReady<Params, Result, WithLine> {
        ParameterizedTestingReady(name: name, before: before, after: after, testWithLine: { activity, params, line in
            try t(activity, params, line)
        })
    }

    public func test<A, B, Result>(_ t: @escaping (XCTActivity, A, B, UInt) throws -> Result) -> ParameterizedTestingReady<Params, Result, WithLine> where Params == (A, B) {
        ParameterizedTestingReady(name: name, before: before, after: after, testWithLine: { activity, params, line in
            try t(activity, params.0, params.1, line)
        })
    }

    public func test<A, B, C, Result>(_ t: @escaping (XCTActivity, A, B, C, UInt) throws -> Result) -> ParameterizedTestingReady<Params, Result, WithLine> where Params == (A, B, C) {
        ParameterizedTestingReady(name: name, before: before, after: after, testWithLine: { activity, params, line in
            try t(activity, params.0, params.1, params.2, line)
        })
    }

    public func test<A, B, C, D, Result>(_ t: @escaping (XCTActivity, A, B, C, D, UInt) throws -> Result) -> ParameterizedTestingReady<Params, Result, WithLine> where Params == (A, B, C, D) {
        ParameterizedTestingReady(name: name, before: before, after: after, testWithLine: { activity, params, line in
            try t(activity, params.0, params.1, params.2, params.3, line)
        })
    }

    public func test<A, B, C, D, E, Result>(_ t: @escaping (XCTActivity, A, B, C, D, E, UInt) throws -> Result) -> ParameterizedTestingReady<Params, Result, WithLine> where Params == (A, B, C, D, E) {
        ParameterizedTestingReady(name: name, before: before, after: after, testWithLine: { activity, params, line in
            try t(activity, params.0, params.1, params.2, params.3, params.4, line)
        })
    }

    public func test<A, B, C, D, E, F, Result>(_ t: @escaping (XCTActivity, A, B, C, D, E, F, UInt) throws -> Result) -> ParameterizedTestingReady<Params, Result, WithLine> where Params == (A, B, C, D, E, F) {
        ParameterizedTestingReady(name: name, before: before, after: after, testWithLine: { activity, params, line in
            try t(activity, params.0, params.1, params.2, params.3, params.4, params.5, line)
        })
    }
}

public protocol LineState {}

public enum WithLine: LineState {}

public enum WithoutLine: LineState {}

public class ParameterizedTestingReady<Params, Result, LState: LineState> {
    let name: String
    var before: (Params) throws -> () = { _ in }
    var after: (Params) throws -> () = { _ in }
    let test:         ((XCTActivity, Params) throws -> Result)?
    let testWithLine: ((XCTActivity, Params, UInt) throws -> Result)?
    var isTested = false

    init(name: String,
         before: @escaping (Params) throws -> (),
         after: @escaping (Params) throws -> (),
         test: ((XCTActivity, Params) throws -> Result)? = .none,
         testWithLine: ((XCTActivity, Params, UInt) throws -> Result)? = .none) {
        assert(test != nil || testWithLine != nil)

        self.name = name
        self.before = before
        self.after = after
        self.test = test
        self.testWithLine = testWithLine
    }

    deinit {
        if !isTested { assertionFailure("ParameterizedTesting '\(name)' isn't tested!") }
    }

    public func before(_ b: @escaping (Params) throws -> ()) -> Self {
        before = b
        return self
    }

    public func after(_ a: @escaping (Params) throws -> ()) -> Self {
        after = a
        return self
    }
}

extension ParameterizedTestingReady where LState == WithoutLine {
    func runTests(rows: [Row<Params>]) throws -> [Result] {
        try rows.map { row in
            try before(row.value)

            let result = try XCTContext.runActivity(named: name) { activity -> Result in
                if let test = test {
                    isTested = true
                    return try test(activity, row.value)
                } else {
                    fatalError()
                }
            }

            try after(row.value)

            return result
        }
    }
}

extension ParameterizedTestingReady where LState == WithLine {
    func runTests(rows: [Row<Params>]) throws -> [Result] {
        try rows.map { row in
            try before(row.value)

            let result = try XCTContext.runActivity(named: name) { activity -> Result in
                if let test = testWithLine {
                    isTested = true
                    return try test(activity, row.value, row.line)
                } else {
                    fatalError()
                }
            }

            try after(row.value)

            return result
        }
    }
}
