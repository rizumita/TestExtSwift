//
// Created by 和泉田 領一 on 2021/02/01.
//

import XCTest
import Foundation
import Algorithms

public typealias RunTests<Value, Result> = (AnySequence<Value>) throws -> [Result]

public protocol EquivalenceClassPartitionProtocol {
    associatedtype Value
    associatedtype Result

    func runTests(values: AnySequence<Value>) throws -> [Result]
}

public protocol OrderState {}

public protocol RelationState {}

public protocol TestState {}

public enum NotReady: OrderState, RelationState, TestState {}

public enum Ready: OrderState, RelationState, TestState {}

public class PartitionState {
    public class Valid: PartitionState {}

    public class Invalid: PartitionState {}
}

public class EquivalenceClassPartition<Value, Result, PState: PartitionState, OState: OrderState, RState: RelationState, TState: TestState>: EquivalenceClassPartitionProtocol {
    private var name:           String
    private var representative: Int
    private var order:          ((Value, Value) throws -> Bool)?
    private var relation:       ((Value) throws -> Bool)?
    private var test:           ((XCTActivity, Value) throws -> Result)?

    init(name: String,
         representative: Int,
         order: ((Value, Value) throws -> Bool)?,
         relation: ((Value) throws -> Bool)?,
         test: ((XCTActivity, Value) throws -> Result)?) {
        self.name = name
        self.representative = representative
        self.order = order
        self.relation = relation
        self.test = test
    }

    public func representative(_ value: Int) -> Self {
        representative = value
        return self
    }

    public func runTests(values: AnySequence<Value>) throws -> [Result] {
        guard let test = test else { fatalError() }

        return try XCTContext.runActivity(named: name) { activity in
            try select(from: values).map { value in
                try test(activity, value)
            }
        }
    }

    public func select<S>(from sequence: S) throws -> [Value] where S: Sequence, S.Element == Value {
        guard let relation = relation else { fatalError() }

        var filtered = try sequence.filter(relation)
        var result   = [Value]()

        if let order = order {
            try result.append(contentsOf: selectBoundaryValues(from: &filtered, order: order))
        }

        result.append(contentsOf: filtered.randomStableSample(count: representative))

        return result
    }

    private func selectBoundaryValues(from array: inout [Value],
                                      order: (Value, Value) throws -> Bool) rethrows -> [Value] {
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

public extension EquivalenceClassPartition where OState == NotReady {
    func order(_ order: @escaping (Value, Value) throws -> Bool) -> EquivalenceClassPartition<Value, Result, PState, Ready, RState, TState> {
        EquivalenceClassPartition<Value, Result, PState, Ready, RState, TState>(name: name,
                                                                                representative: representative,
                                                                                order: order,
                                                                                relation: relation,
                                                                                test: test)
    }
}

public extension EquivalenceClassPartition where RState == NotReady {
    func relation(_ relation: @escaping (Value) throws -> Bool) -> EquivalenceClassPartition<Value, Result, PState, OState, Ready, TState> {
        EquivalenceClassPartition<Value, Result, PState, OState, Ready, TState>(name: name,
                                                                                representative: representative,
                                                                                order: order,
                                                                                relation: relation,
                                                                                test: test)
    }
}

public extension EquivalenceClassPartition where TState == NotReady {
    func test(_ test: @escaping (XCTActivity, Value) throws -> Result) -> EquivalenceClassPartition<Value, Result, PState, OState, RState, Ready> {
        EquivalenceClassPartition<Value, Result, PState, OState, RState, Ready>(name: name,
                                                                                representative: representative,
                                                                                order: order,
                                                                                relation: relation,
                                                                                test: test)
    }

    func test<A, B>(_ test: @escaping (XCTActivity, A, B) throws -> Result) -> EquivalenceClassPartition<Value, Result, PState, OState, RState, Ready> where Value == (A, B) {
        EquivalenceClassPartition<Value, Result, PState, OState, RState, Ready>(name: name,
                                                                                representative: representative,
                                                                                order: order,
                                                                                relation: relation
        ) { activity, value in
            try test(activity, value.0, value.1)
        }
    }

    func test<A, B, C>(_ test: @escaping (XCTActivity, A, B, C) throws -> Result) -> EquivalenceClassPartition<Value, Result, PState, OState, RState, Ready> where Value == (A, B, C) {
        EquivalenceClassPartition<Value, Result, PState, OState, RState, Ready>(name: name,
                                                                                representative: representative,
                                                                                order: order,
                                                                                relation: relation
        ) { activity, value in
            try test(activity, value.0, value.1, value.2)
        }
    }

    func test<A, B, C, D>(_ test: @escaping (XCTActivity, A, B, C, D) throws -> Result) -> EquivalenceClassPartition<Value, Result, PState, OState, RState, Ready> where Value == (A, B, C, D) {
        EquivalenceClassPartition<Value, Result, PState, OState, RState, Ready>(name: name,
                                                                                representative: representative,
                                                                                order: order,
                                                                                relation: relation
        ) { activity, value in
            try test(activity, value.0, value.1, value.2, value.3)
        }
    }

    func test<A, B, C, D, E>(_ test: @escaping (XCTActivity, A, B, C, D, E) throws -> Result) -> EquivalenceClassPartition<Value, Result, PState, OState, RState, Ready> where Value == (A, B, C, D, E) {
        EquivalenceClassPartition<Value, Result, PState, OState, RState, Ready>(name: name,
                                                                                representative: representative,
                                                                                order: order,
                                                                                relation: relation
        ) { activity, value in
            try test(activity, value.0, value.1, value.2, value.3, value.4)
        }
    }

    func test<A, B, C, D, E, F>(_ test: @escaping (XCTActivity, A, B, C, D, E, F) throws -> Result) -> EquivalenceClassPartition<Value, Result, PState, OState, RState, Ready> where Value == (A, B, C, D, E, F) {
        EquivalenceClassPartition<Value, Result, PState, OState, RState, Ready>(name: name,
                                                                                representative: representative,
                                                                                order: order,
                                                                                relation: relation
        ) { activity, value in
            try test(activity, value.0, value.1, value.2, value.3, value.4, value.5)
        }
    }
}

public typealias Valid = ValidPartition

public class ValidPartition<Value, Result>: EquivalenceClassPartition<Value, Result, PartitionState.Valid, NotReady, NotReady, NotReady> {
    public init(_ name: String) {
        super.init(name: name,
                   representative: 100,
                   order: .none,
                   relation: .none,
                   test: .none)
    }

    init(name: String, order: @escaping (Value, Value) throws -> Bool) {
        super.init(name: name,
                   representative: 100,
                   order: order,
                   relation: .none,
                   test: .none)
    }
}

extension ValidPartition where Value: Comparable {
    public convenience init(_ name: String) {
        self.init(name: name, order: { $0 <= $1 })
    }
}

public typealias Invalid = InvalidPartition

public class InvalidPartition<Value, Result>: EquivalenceClassPartition<Value, Result, PartitionState.Invalid, NotReady, NotReady, NotReady> {
    public init(_ name: String) {
        super.init(name: name,
                   representative: 100,
                   order: .none,
                   relation: .none,
                   test: .none)
    }

    init(name: String, order: @escaping (Value, Value) throws -> Bool) {
        super.init(name: name,
                   representative: 100,
                   order: order,
                   relation: .none,
                   test: .none)
    }
}

extension InvalidPartition where Value: Comparable {
    public convenience init(_ name: String) {
        self.init(name: name, order: { $0 <= $1 })
    }
}
