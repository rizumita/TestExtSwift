//
// Created by 和泉田 領一 on 2021/02/06.
//

import Foundation

public class Row<Value> {
    var value: Value
    var line: UInt

    public init(value: Value, line: UInt) {
        self.value = value
        self.line = line
    }
}
