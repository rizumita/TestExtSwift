//
// Created by 和泉田 領一 on 2021/02/03.
//

import Foundation
import XCTest

public func =><S, Value>(lhs: S, @PartitionsBuilder rhs: () -> [EquivalenceClassPartition<Value, ()>]) throws where S: Sequence, S.Element == Value {
    for partition in rhs() {
        for value in try partition.select(from: lhs) {
            _ = try XCTContext.runActivity(named: partition.name) { activity in
                try partition.test(activity, value)
            }
        }
    }
}

public func =><Value>(lhs: @escaping (Value) throws -> Bool,
                      rhs: @escaping (XCTActivity, Value) throws -> ())
        -> ((Value) throws -> Bool, (XCTActivity, Value) throws -> ()) {
    (lhs, rhs)
}

public func =><Value>(lhs: (Bool, String, Int, ((Value, Value) throws -> Bool)?), rhs: ((Value) throws -> Bool, (XCTActivity, Value) throws -> ())) -> EquivalenceClassPartition<Value, ()> {
    if lhs.0 {
        return .valid(name: lhs.1, representative: lhs.2, boundary: lhs.3, relation: rhs.0, test: rhs.1)
    } else {
        return .invalid(name: lhs.1, representative: lhs.2, boundary: lhs.3, relation: rhs.0, test: rhs.1)
    }
}
