//
//  XCTContext+Parameterized.swift
//  TestExtSwift
//
//  Created by 和泉田 領一 on 2021/01/23.
//

import XCTest

import XCTest

// Sequence params
public extension XCTContext {
    @discardableResult
    class func runActivity<S, A, Result>(named name: String,
                                         params: S,
                                         before: ((A) throws -> ())? = .none,
                                         after: ((A) throws -> ())? = .none,
                                         test: @escaping (XCTActivity, A) throws -> Result) rethrows
            -> [Result] where S: Sequence, S.Element == A {
        try params.map { param in
            try XCTContext.runActivity(named: name) { activity -> Result in
                try before?(param)
                let result = try test(activity, param)
                try after?(param)
                return result
            }
        }
    }

    @discardableResult
    class func runActivity<S, A, B, Result>(named name: String,
                                            params: S,
                                            before: ((A, B) throws -> ())? = .none,
                                            after: ((A, B) throws -> ())? = .none,
                                            test: @escaping (XCTActivity, A, B) throws -> Result) rethrows
            -> [Result] where S: Sequence, S.Element == (A, B) {
        try params.map { param in
            try XCTContext.runActivity(named: name) { activity -> Result in
                try before?(param.0, param.1)
                let result = try test(activity, param.0, param.1)
                try after?(param.0, param.1)
                return result
            }
        }
    }

    @discardableResult
    class func runActivity<S, A, B, C, Result>(named name: String,
                                               params: S,
                                               before: ((A, B, C) throws -> ())? = .none,
                                               after: ((A, B, C) throws -> ())? = .none,
                                               test: @escaping (XCTActivity, A, B, C) throws -> Result) rethrows
            -> [Result] where S: Sequence, S.Element == (A, B, C) {
        try params.map { param in
            try XCTContext.runActivity(named: name) { activity -> Result in
                try before?(param.0, param.1, param.2)
                let result = try test(activity, param.0, param.1, param.2)
                try after?(param.0, param.1, param.2)
                return result
            }
        }
    }

    @discardableResult
    class func runActivity<S, A, B, C, D, Result>(named name: String,
                                                  params: S,
                                                  before: ((A, B, C, D) throws -> ())? = .none,
                                                  after: ((A, B, C, D) throws -> ())? = .none,
                                                  test: @escaping (XCTActivity, A, B, C, D) throws -> Result) rethrows
            -> [Result] where S: Sequence, S.Element == (A, B, C, D) {
        try params.map { param in
            try XCTContext.runActivity(named: name) { activity -> Result in
                try before?(param.0, param.1, param.2, param.3)
                let result = try test(activity, param.0, param.1, param.2, param.3)
                try after?(param.0, param.1, param.2, param.3)
                return result
            }
        }
    }

    @discardableResult
    class func runActivity<S, A, B, C, D, E, Result>(named name: String,
                                                     params: S,
                                                     before: ((A, B, C, D, E) throws -> ())? = .none,
                                                     after: ((A, B, C, D, E) throws -> ())? = .none,
                                                     test: @escaping (XCTActivity, A, B, C, D, E) throws -> Result) rethrows
            -> [Result] where S: Sequence, S.Element == (A, B, C, D, E) {
        try params.map { param in
            try XCTContext.runActivity(named: name) { activity -> Result in
                try before?(param.0, param.1, param.2, param.3, param.4)
                let result = try test(activity, param.0, param.1, param.2, param.3, param.4)
                try after?(param.0, param.1, param.2, param.3, param.4)
                return result
            }
        }
    }

    @discardableResult
    class func runActivity<S, A, B, C, D, E, F, Result>(named name: String,
                                                        params: S,
                                                        before: ((A, B, C, D, E, F) throws -> ())? = .none,
                                                        after: ((A, B, C, D, E, F) throws -> ())? = .none,
                                                        test: @escaping (XCTActivity, A, B, C, D, E, F) throws -> Result) rethrows
            -> [Result] where S: Sequence, S.Element == (A, B, C, D, E, F) {
        try params.map { param in
            try XCTContext.runActivity(named: name) { activity -> Result in
                try before?(param.0, param.1, param.2, param.3, param.4, param.5)
                let result = try test(activity, param.0, param.1, param.2, param.3, param.4, param.5)
                try after?(param.0, param.1, param.2, param.3, param.4, param.5)
                return result
            }
        }
    }
}

// Sequence of Row params
public extension XCTContext {
    @discardableResult
    class func runActivity<S, A, Result>(named name: String,
                                         params: S,
                                         before: ((A) throws -> ())? = .none,
                                         after: ((A) throws -> ())? = .none,
                                         test: @escaping (XCTActivity, A, UInt) throws -> Result) rethrows
            -> [Result] where S: Sequence, S.Element == Row<A> {
        try params.map { param in
            try XCTContext.runActivity(named: name) { activity -> Result in
                try before?(param.value)
                let result = try test(activity, param.value, param.line)
                try after?(param.value)
                return result
            }
        }
    }

    @discardableResult
    class func runActivity<S, A, B, Result>(named name: String,
                                            params: S,
                                            before: ((A, B) throws -> ())? = .none,
                                            after: ((A, B) throws -> ())? = .none,
                                            test: @escaping (XCTActivity, A, B, UInt) throws -> Result) rethrows
            -> [Result] where S: Sequence, S.Element == Row<(A, B)> {
        try params.map { param in
            try XCTContext.runActivity(named: name) { activity -> Result in
                try before?(param.value.0, param.value.1)
                let result = try test(activity, param.value.0, param.value.1, param.line)
                try after?(param.value.0, param.value.1)
                return result
            }
        }
    }

    @discardableResult
    class func runActivity<S, A, B, C, Result>(named name: String,
                                               params: S,
                                               before: ((A, B, C) throws -> ())? = .none,
                                               after: ((A, B, C) throws -> ())? = .none,
                                               test: @escaping (XCTActivity, A, B, C, UInt) throws -> Result) rethrows
            -> [Result] where S: Sequence, S.Element == Row<(A, B, C)> {
        try params.map { param in
            try XCTContext.runActivity(named: name) { activity -> Result in
                try before?(param.value.0, param.value.1, param.value.2)
                let result = try test(activity, param.value.0, param.value.1, param.value.2, param.line)
                try after?(param.value.0, param.value.1, param.value.2)
                return result
            }
        }
    }

    @discardableResult
    class func runActivity<S, A, B, C, D, Result>(named name: String,
                                                  params: S,
                                                  before: ((A, B, C, D) throws -> ())? = .none,
                                                  after: ((A, B, C, D) throws -> ())? = .none,
                                                  test: @escaping (XCTActivity, A, B, C, D, UInt) throws -> Result) rethrows
            -> [Result] where S: Sequence, S.Element == Row<(A, B, C, D)> {
        try params.map { param in
            try XCTContext.runActivity(named: name) { activity -> Result in
                try before?(param.value.0, param.value.1, param.value.2, param.value.3)
                let result = try test(activity, param.value.0, param.value.1, param.value.2, param.value.3, param.line)
                try after?(param.value.0, param.value.1, param.value.2, param.value.3)
                return result
            }
        }
    }

    @discardableResult
    class func runActivity<S, A, B, C, D, E, Result>(named name: String,
                                                     params: S,
                                                     before: ((A, B, C, D, E) throws -> ())? = .none,
                                                     after: ((A, B, C, D, E) throws -> ())? = .none,
                                                     test: @escaping (XCTActivity, A, B, C, D, E, UInt) throws -> Result) rethrows
            -> [Result] where S: Sequence, S.Element == Row<(A, B, C, D, E)> {
        try params.map { param in
            try XCTContext.runActivity(named: name) { activity -> Result in
                try before?(param.value.0, param.value.1, param.value.2, param.value.3, param.value.4)
                let result = try test(activity, param.value.0, param.value.1, param.value.2, param.value.3,
                                      param.value.4, param.line)
                try after?(param.value.0, param.value.1, param.value.2, param.value.3, param.value.4)
                return result
            }
        }
    }

    @discardableResult
    class func runActivity<S, A, B, C, D, E, F, Result>(named name: String,
                                                        params: S,
                                                        before: ((A, B, C, D, E, F) throws -> ())? = .none,
                                                        after: ((A, B, C, D, E, F) throws -> ())? = .none,
                                                        test: @escaping (XCTActivity, A, B, C, D, E, F, UInt) throws -> Result) rethrows
            -> [Result] where S: Sequence, S.Element == Row<(A, B, C, D, E, F)> {
        try params.map { param in
            try XCTContext.runActivity(named: name) { activity -> Result in
                try before?(param.value.0, param.value.1, param.value.2, param.value.3, param.value.4, param.value.5)
                let result = try test(activity, param.value.0, param.value.1, param.value.2, param.value.3,
                                      param.value.4, param.value.5, param.line)
                try after?(param.value.0, param.value.1, param.value.2, param.value.3, param.value.4, param.value.5)
                return result
            }
        }
    }
}

// SourcesBuilder params
public extension XCTContext {
    @discardableResult
    class func runActivity<A, Result>(named name: String,
                                      @SourcesBuilder params: () -> [A],
                                      before: ((A) throws -> ())? = .none,
                                      after: ((A) throws -> ())? = .none,
                                      test: @escaping (XCTActivity, A) throws -> Result) rethrows
            -> [Result] {
        try params().map { param in
            try XCTContext.runActivity(named: name) { activity -> Result in
                try before?(param)
                let result = try test(activity, param)
                try after?(param)
                return result
            }
        }
    }

    @discardableResult
    class func runActivity<A, B, Result>(named name: String,
                                         @SourcesBuilder params: () -> [(A, B)],
                                         before: ((A, B) throws -> ())? = .none,
                                         after: ((A, B) throws -> ())? = .none,
                                         test: @escaping (XCTActivity, A, B) throws -> Result) rethrows
            -> [Result] {
        try params().map { param in
            try XCTContext.runActivity(named: name) { activity -> Result in
                try before?(param.0, param.1)
                let result = try test(activity, param.0, param.1)
                try after?(param.0, param.1)
                return result
            }
        }
    }

    @discardableResult
    class func runActivity<A, B, C, Result>(named name: String,
                                            @SourcesBuilder params: () -> [(A, B, C)],
                                            before: ((A, B, C) throws -> ())? = .none,
                                            after: ((A, B, C) throws -> ())? = .none,
                                            test: @escaping (XCTActivity, A, B, C) throws -> Result) rethrows
            -> [Result] {
        try params().map { param in
            try XCTContext.runActivity(named: name) { activity -> Result in
                try before?(param.0, param.1, param.2)
                let result = try test(activity, param.0, param.1, param.2)
                try after?(param.0, param.1, param.2)
                return result
            }
        }
    }

    @discardableResult
    class func runActivity<A, B, C, D, Result>(named name: String,
                                               @SourcesBuilder params: () -> [(A, B, C, D)],
                                               before: ((A, B, C, D) throws -> ())? = .none,
                                               after: ((A, B, C, D) throws -> ())? = .none,
                                               test: @escaping (XCTActivity, A, B, C, D) throws -> Result) rethrows
            -> [Result] {
        try params().map { param in
            try XCTContext.runActivity(named: name) { activity -> Result in
                try before?(param.0, param.1, param.2, param.3)
                let result = try test(activity, param.0, param.1, param.2, param.3)
                try after?(param.0, param.1, param.2, param.3)
                return result
            }
        }
    }

    @discardableResult
    class func runActivity<A, B, C, D, E, Result>(named name: String,
                                                  @SourcesBuilder params: () -> [(A, B, C, D, E)],
                                                  before: ((A, B, C, D, E) throws -> ())? = .none,
                                                  after: ((A, B, C, D, E) throws -> ())? = .none,
                                                  test: @escaping (XCTActivity, A, B, C, D, E) throws -> Result) rethrows
            -> [Result] {
        try params().map { param in
            try XCTContext.runActivity(named: name) { activity -> Result in
                try before?(param.0, param.1, param.2, param.3, param.4)
                let result = try test(activity, param.0, param.1, param.2, param.3, param.4)
                try after?(param.0, param.1, param.2, param.3, param.4)
                return result
            }
        }
    }

    @discardableResult
    class func runActivity<A, B, C, D, E, F, Result>(named name: String,
                                                     @SourcesBuilder params: () -> [(A, B, C, D, E, F)],
                                                     before: ((A, B, C, D, E, F) throws -> ())? = .none,
                                                     after: ((A, B, C, D, E, F) throws -> ())? = .none,
                                                     test: @escaping (XCTActivity, A, B, C, D, E, F) throws -> Result) rethrows
            -> [Result] {
        try params().map { param in
            try XCTContext.runActivity(named: name) { activity -> Result in
                try before?(param.0, param.1, param.2, param.3, param.4, param.5)
                let result = try test(activity, param.0, param.1, param.2, param.3, param.4, param.5)
                try after?(param.0, param.1, param.2, param.3, param.4, param.5)
                return result
            }
        }
    }
}

// SourcesBuilder with Row params
public extension XCTContext {
    @discardableResult
    class func runActivity<A, Result>(named name: String,
                                      @SourcesBuilder params: () -> [Row<A>],
                                      before: ((A) throws -> ())? = .none,
                                      after: ((A) throws -> ())? = .none,
                                      test: @escaping (XCTActivity, A, UInt) throws -> Result) rethrows
            -> [Result] {
        try params().map { param in
            try XCTContext.runActivity(named: name) { activity -> Result in
                try before?(param.value)
                let result = try test(activity, param.value, param.line)
                try after?(param.value)
                return result
            }
        }
    }

    @discardableResult
    class func runActivity<A, B, Result>(named name: String,
                                         @SourcesBuilder params: () -> [Row<(A, B)>],
                                         before: ((A, B) throws -> ())? = .none,
                                         after: ((A, B) throws -> ())? = .none,
                                         test: @escaping (XCTActivity, A, B, UInt) throws -> Result) rethrows
            -> [Result] {
        try params().map { param in
            try XCTContext.runActivity(named: name) { activity -> Result in
                try before?(param.value.0, param.value.1)
                let result = try test(activity, param.value.0, param.value.1, param.line)
                try after?(param.value.0, param.value.1)
                return result
            }
        }
    }

    @discardableResult
    class func runActivity<A, B, C, Result>(named name: String,
                                            @SourcesBuilder params: () -> [Row<(A, B, C)>],
                                            before: ((A, B, C) throws -> ())? = .none,
                                            after: ((A, B, C) throws -> ())? = .none,
                                            test: @escaping (XCTActivity, A, B, C, UInt) throws -> Result) rethrows
            -> [Result] {
        try params().map { param in
            try XCTContext.runActivity(named: name) { activity -> Result in
                try before?(param.value.0, param.value.1, param.value.2)
                let result = try test(activity, param.value.0, param.value.1, param.value.2, param.line)
                try after?(param.value.0, param.value.1, param.value.2)
                return result
            }
        }
    }

    @discardableResult
    class func runActivity<A, B, C, D, Result>(named name: String,
                                               @SourcesBuilder params: () -> [Row<(A, B, C, D)>],
                                               before: ((A, B, C, D) throws -> ())? = .none,
                                               after: ((A, B, C, D) throws -> ())? = .none,
                                               test: @escaping (XCTActivity, A, B, C, D, UInt) throws -> Result) rethrows
            -> [Result] {
        try params().map { param in
            try XCTContext.runActivity(named: name) { activity -> Result in
                try before?(param.value.0, param.value.1, param.value.2, param.value.3)
                let result = try test(activity, param.value.0, param.value.1, param.value.2, param.value.3, param.line)
                try after?(param.value.0, param.value.1, param.value.2, param.value.3)
                return result
            }
        }
    }

    @discardableResult
    class func runActivity<A, B, C, D, E, Result>(named name: String,
                                                  @SourcesBuilder params: () -> [Row<(A, B, C, D, E)>],
                                                  before: ((A, B, C, D, E) throws -> ())? = .none,
                                                  after: ((A, B, C, D, E) throws -> ())? = .none,
                                                  test: @escaping (XCTActivity, A, B, C, D, E, UInt) throws -> Result) rethrows
            -> [Result] {
        try params().map { param in
            try XCTContext.runActivity(named: name) { activity -> Result in
                try before?(param.value.0, param.value.1, param.value.2, param.value.3, param.value.4)
                let result = try test(activity, param.value.0, param.value.1, param.value.2, param.value.3,
                                      param.value.4, param.line)
                try after?(param.value.0, param.value.1, param.value.2, param.value.3, param.value.4)
                return result
            }
        }
    }

    @discardableResult
    class func runActivity<A, B, C, D, E, F, Result>(named name: String,
                                                     @SourcesBuilder params: () -> [Row<(A, B, C, D, E, F)>],
                                                     before: ((A, B, C, D, E, F) throws -> ())? = .none,
                                                     after: ((A, B, C, D, E, F) throws -> ())? = .none,
                                                     test: @escaping (XCTActivity, A, B, C, D, E, F, UInt) throws -> Result) rethrows
            -> [Result] {
        try params().map { param in
            try XCTContext.runActivity(named: name) { activity -> Result in
                try before?(param.value.0, param.value.1, param.value.2, param.value.3, param.value.4, param.value.5)
                let result = try test(activity, param.value.0, param.value.1, param.value.2, param.value.3,
                                      param.value.4, param.value.5, param.line)
                try after?(param.value.0, param.value.1, param.value.2, param.value.3, param.value.4, param.value.5)
                return result
            }
        }
    }
}
