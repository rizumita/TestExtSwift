//
// Created by 和泉田 領一 on 2021/02/03.
//

import Foundation

@_functionBuilder
public struct PartitionsBuilder {
    public static func buildBlock<Value>(_ array: EquivalenceClassPartition<Value, ()>...) -> [EquivalenceClassPartition<Value, ()>] {
        array
    }
}
