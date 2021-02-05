//
// Created by 和泉田 領一 on 2021/02/04.
//

import Foundation
import XCTest

@discardableResult
public func =><P, R>(lhs: [Row<P>], rhs: ParameterizedTesting<P, R>) throws -> [Result<R, Error>] {
    rhs.params = lhs
    return try rhs.runTests()
}

@discardableResult
public func =><P, R>(@SourcesBuilder lhs: () -> [Row<P>], rhs: ParameterizedTesting<P, R>) throws -> [Result<R, Error>] {
    rhs.params = lhs()
    return try rhs.runTests()
}

@discardableResult
public func -<P, R>(lhs: ParameterizedTesting<P, R>, rhs: Before<P>) -> ParameterizedTesting<P, R> {
    lhs.before = rhs
    return lhs
}

@discardableResult
public func -<P, R>(lhs: ParameterizedTesting<P, R>, rhs: After<P>) -> ParameterizedTesting<P, R> {
    lhs.after = rhs
    return lhs
}

@discardableResult
public func -<P, R>(lhs: ParameterizedTesting<P, R>, rhs: @escaping Test<P, R>) -> ParameterizedTesting<P, R> {
    lhs.test = rhs
    return lhs
}
