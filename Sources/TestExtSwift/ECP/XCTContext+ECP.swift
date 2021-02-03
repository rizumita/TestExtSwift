//
// Created by 和泉田 領一 on 2021/02/03.
//

import Foundation
import XCTest

public extension XCTContext {
    class func runActivity<S, Result>(values: S,
                                      partitions: EquivalenceClassPartition<S.Element, Result>...) throws where S: Sequence {
        for partition in partitions {
            for value in try partition.select(from: values) {
                _ = try XCTContext.runActivity(named: partition.name) { activity in
                    try partition.test(activity, value)
                }
            }
        }
    }
}
