//
//  Src.swift
//  TestExtSwift
//
//  Created by 和泉田 領一 on 2021/01/23.
//

import Foundation
import XCTest

public func s<Argument>(_ argument: Argument, _ line: UInt = #line) -> (Argument, UInt) {
    (argument, line)
}

public func s<Argument, ExpectedResult>(_ argument: Argument,
                                        _ expectedResult: ExpectedResult,
                                        _ line: UInt = #line) -> (Argument, ExpectedResult, UInt) {
    (argument, expectedResult, line)
}

public func before<Value>(_ action: @escaping (Value) throws -> ()) -> Before<Value> { Before(action: action) }

public func after<Value>(_ action: @escaping (Value) throws -> ()) -> After<Value> { After(action: action) }

public typealias Test<Value, Result> = (XCTActivity, Value, UInt) throws -> Result

public func test<V1, R>(_ t: @escaping (XCTActivity, V1, UInt) throws -> R) -> Test<V1, R> { t }

public func test<V1, V2, R>(_ t: @escaping (XCTActivity, V1, V2, UInt) throws -> R) -> Test<(V1, V2), R> {
    { activity, params, line in
        try t(activity, params.0, params.1, line)
    }
}

public func test<V1, V2, V3, R>(_ t: @escaping (XCTActivity, V1, V2, V3, UInt) throws -> R) -> Test<(V1, V2, V3), R> {
    { activity, params, line in
        try t(activity, params.0, params.1, params.2, line)
    }
}

public func test<V1, V2, V3, V4, R>(_ t: @escaping (XCTActivity, V1, V2, V3, V4, UInt) throws -> R) -> Test<(V1, V2, V3, V4), R> {
    { activity, params, line in
        try t(activity, params.0, params.1, params.2, params.3, line)
    }
}

public func test<V1, V2, V3, V4, V5, R>(_ t: @escaping (XCTActivity, V1, V2, V3, V4, V5, UInt) throws -> R) -> Test<(V1, V2, V3, V4, V5), R> {
    { activity, params, line in
        try t(activity, params.0, params.1, params.2, params.3, params.4, line)
    }
}
