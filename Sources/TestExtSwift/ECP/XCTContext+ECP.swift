//
// Created by 和泉田 領一 on 2021/02/03.
//

import Foundation
import XCTest

public extension XCTContext {
    @discardableResult
    class func runActivity<S, Result>(values: S,
                                      partitions: EquivalenceClassPartition<S.Element, Result>...) throws -> [Result] where S: Sequence {
        var results = [Result]()

        for partition in partitions {
            for value in try partition.select(from: values) {
                _ = try XCTContext.runActivity(named: partition.name) { activity in
                    let result = try partition.test(activity, value)
                    results.append(result)
                }
            }
        }

        return results
    }
}
