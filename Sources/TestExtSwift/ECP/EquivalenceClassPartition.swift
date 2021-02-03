//
// Created by 和泉田 領一 on 2021/02/01.
//

import XCTest
import Foundation
import Algorithms

public struct EquivalenceClassPartition<Value, Result> {
    var isValid: Bool
    var name: String
    var representative: Int
    var boundary: ((Value, Value) throws -> Bool)?
    var relation: (Value) throws -> Bool
    var test: (XCTActivity, Value) throws -> Result

    public static func valid(name: String,
                             representative: Int = 100,
                             boundary: ((Value, Value) throws -> Bool)? = .none,
                             relation: @escaping (Value) throws -> Bool,
                             test: @escaping (XCTActivity, Value) throws -> Result) -> EquivalenceClassPartition<Value, Result> {
        EquivalenceClassPartition<Value, Result>(isValid: true,
                                                 name: name,
                                                 representative: representative,
                                                 boundary: boundary,
                                                 relation: relation,
                                                 test: test)
    }

    public static func invalid(name: String,
                               representative: Int = 100,
                               boundary: ((Value, Value) throws -> Bool)? = .none,
                               relation: @escaping (Value) throws -> Bool,
                               test: @escaping (XCTActivity, Value) throws -> Result) -> EquivalenceClassPartition<Value, Result> {
        EquivalenceClassPartition<Value, Result>(isValid: false,
                                                 name: name,
                                                 representative: representative,
                                                 boundary: boundary,
                                                 relation: relation,
                                                 test: test)
    }

    func select<S>(from sequence: S) throws -> [Value] where S: Sequence, S.Element == Value {
        var filtered = try sequence.filter(relation)
        var result = [Value]()

        if let boundary = boundary {
            try result.append(contentsOf: selectBoundaryValues(from: &filtered, order: boundary))
        }

        result.append(contentsOf: filtered.randomStableSample(count: representative))

        return result
    }

    private func selectBoundaryValues(from array: inout [Value], order: (Value, Value) throws -> Bool) rethrows -> [Value] {
        try array.sort(by: order)

        if array.isEmpty {
            return []
        } else if array.count == 1 {
            return [array.removeFirst()]
        } else {
            return [array.removeFirst(), array.removeLast()]
        }
    }
}

public extension EquivalenceClassPartition where Value: Comparable {
    static func valid(name: String,
                      representative: Int = 100,
                      boundary: ((Value, Value) throws -> Bool)? = { $0 <= $1 },
                      relation: @escaping (Value) throws -> Bool,
                      test: @escaping (XCTActivity, Value) throws -> Result) -> EquivalenceClassPartition<Value, Result> {
        EquivalenceClassPartition<Value, Result>(isValid: true,
                                                 name: name,
                                                 representative: representative,
                                                 boundary: boundary,
                                                 relation: relation,
                                                 test: test)
    }

    static func invalid(name: String,
                        representative: Int = 100,
                        boundary: ((Value, Value) throws -> Bool)? = { $0 <= $1 },
                        relation: @escaping (Value) throws -> Bool,
                        test: @escaping (XCTActivity, Value) throws -> Result) -> EquivalenceClassPartition<Value, Result> {
        EquivalenceClassPartition<Value, Result>(isValid: false,
                                                 name: name,
                                                 representative: representative,
                                                 boundary: boundary,
                                                 relation: relation,
                                                 test: test)
    }
}
