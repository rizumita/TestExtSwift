//
// Created by 和泉田 領一 on 2021/02/04.
//

import Foundation
import XCTest

@discardableResult
public func =><P, R>(lhs: [Row<P>], rhs: ParameterizedTestingReady<P, R>) throws -> [R] {
    try rhs.runTests(rows: lhs)
}

@discardableResult
public func =><P, R>(@SourcesBuilder lhs: () -> [Row<P>], rhs: ParameterizedTestingReady<P, R>) throws -> [R] {
    try rhs.runTests(rows: lhs())
}

@discardableResult
public func =><S, P, R>(lhs: S, rhs: ParameterizedTestingReady<P, R>) throws -> [R] where S: Sequence, S.Element == P {
    let rows = lhs.map { Row(value: $0, line: 0) }
    return try rhs.runTests(rows: rows)
}
