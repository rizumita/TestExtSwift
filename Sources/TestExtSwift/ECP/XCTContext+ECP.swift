//
// Created by 和泉田 領一 on 2021/02/03.
//

import Foundation
import XCTest

public extension XCTContext {
    @discardableResult
    class func runActivity<S, Value, Result>(values: S,
                                             @PartitionsBuilder partitions: () -> [RunTests<Value, Result>]) throws -> [Result] where S: Sequence, S.Element == Value {
        try partitions().flatMap { runTests in try runTests(AnySequence(values)) }
    }

    class func runActivity<Value, Result>(@SourcesBuilder values: () -> [Value],
                                          @PartitionsBuilder partitions: () -> [RunTests<Value, Result>]) throws -> [Result] {
        let v = values()
        return try partitions().flatMap { runTests in try runTests(AnySequence(v)) }
    }
}
