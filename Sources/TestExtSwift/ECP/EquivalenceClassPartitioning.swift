//
// Created by 和泉田 領一 on 2021/02/09.
//

import Foundation

public typealias ECP = EquivalenceClassPartitioning

public class EquivalenceClassPartitioning<Value, Result> {
    let name:       String
    var partitions: [RunTests<Value, Result>]

    public init(_ name: String = "",
                @PartitionsBuilder _ partitions: () -> [RunTests<Value, Result>]) {
        self.name = name
        self.partitions = partitions()
    }

    func runTests(values: AnySequence<Value>) throws -> [Result] {
        try partitions.flatMap { runTests in try runTests(values) }
    }
}
