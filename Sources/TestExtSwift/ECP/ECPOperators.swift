//
// Created by 和泉田 領一 on 2021/02/03.
//

import Foundation
import XCTest

@discardableResult
public func =><S, Value, Result>(lhs: S, rhs: EquivalenceClassPartitioning<Value, Result>) throws -> [Result] where S: Sequence, S.Element == Value {
    try rhs.runTests(values: AnySequence(lhs))
}

@discardableResult
public func =><Value, Result>(@SourcesBuilder lhs: () -> [Value],
                              rhs: EquivalenceClassPartitioning<Value, Result>) throws -> [Result] {
    try rhs.runTests(values: AnySequence(lhs()))
}

@discardableResult
public func =><S, Value, Result>(lhs: S,
                          @PartitionsBuilder partitions: () -> [RunTests<Value, Result>]) throws -> [Result] where S: Sequence, S.Element == Value {
    try partitions().flatMap { runTests in try runTests(AnySequence(lhs)) }
}

@discardableResult
public func =><S, Value, Result>(@SourcesBuilder lhs: () -> S,
                          @PartitionsBuilder partitions: () -> RunTests<Value, Result>) throws -> [Result] where S: Sequence, S.Element == Value {
    try partitions()(AnySequence(lhs()))
}
