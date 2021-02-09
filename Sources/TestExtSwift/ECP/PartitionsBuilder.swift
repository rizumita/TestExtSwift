//
// Created by 和泉田 領一 on 2021/02/03.
//

import Foundation

@_functionBuilder
public struct PartitionsBuilder {
    public static func buildBlock<A>(_ a: A) -> [RunTests<A.Value, A.Result>] where A: EquivalenceClassPartitionProtocol {
        [a.runTests(values:)]
    }

    public static func buildBlock<A, B>(_ a: A, _ b: B)
            -> [RunTests<A.Value, A.Result>] where A: EquivalenceClassPartitionProtocol, B: EquivalenceClassPartitionProtocol, A.Value == B.Value, A.Result == B.Result {
        [a.runTests(values:), b.runTests(values:)]
    }

    public static func buildBlock<A, B, C>(_ a: A, _ b: B, _ c: C)
            -> [RunTests<A.Value, A.Result>] where
    A: EquivalenceClassPartitionProtocol, B: EquivalenceClassPartitionProtocol, C: EquivalenceClassPartitionProtocol,
    A.Value == B.Value, A.Value == C.Value,
    A.Result == B.Result, A.Result == C.Result {
        [a.runTests(values:), b.runTests(values:), c.runTests(values:)]
    }

    public static func buildBlock<A, B, C, D>(_ a: A, _ b: B, _ c: C, _ d: D)
            -> [RunTests<A.Value, A.Result>] where
    A: EquivalenceClassPartitionProtocol, B: EquivalenceClassPartitionProtocol, C: EquivalenceClassPartitionProtocol, D: EquivalenceClassPartitionProtocol,
    A.Value == B.Value, A.Value == C.Value, A.Value == D.Value,
    A.Result == B.Result, A.Result == C.Result, A.Result == D.Result {
        [a.runTests(values:), b.runTests(values:), c.runTests(values:), d.runTests(values:)]
    }

    public static func buildBlock<A, B, C, D, E>(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E)
            -> [RunTests<A.Value, A.Result>] where
    A: EquivalenceClassPartitionProtocol, B: EquivalenceClassPartitionProtocol, C: EquivalenceClassPartitionProtocol, D: EquivalenceClassPartitionProtocol, E: EquivalenceClassPartitionProtocol,
    A.Value == B.Value, A.Value == C.Value, A.Value == D.Value, A.Value == E.Value,
    A.Result == B.Result, A.Result == C.Result, A.Result == D.Result, A.Result == E.Result {
        [a.runTests(values:), b.runTests(values:), c.runTests(values:), d.runTests(values:), e.runTests(values:)]
    }

    public static func buildBlock<A, B, C, D, E, F>(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F)
            -> [RunTests<A.Value, A.Result>] where
    A: EquivalenceClassPartitionProtocol, B: EquivalenceClassPartitionProtocol, C: EquivalenceClassPartitionProtocol, D: EquivalenceClassPartitionProtocol, E: EquivalenceClassPartitionProtocol, F: EquivalenceClassPartitionProtocol,
    A.Value == B.Value, A.Value == C.Value, A.Value == D.Value, A.Value == E.Value, A.Value == F.Value,
    A.Result == B.Result, A.Result == C.Result, A.Result == D.Result, A.Result == E.Result, A.Result == F.Result {
        [a.runTests(values:), b.runTests(values:), c.runTests(values:), d.runTests(values:), e.runTests(values:), f.runTests(values:)]
    }
}
