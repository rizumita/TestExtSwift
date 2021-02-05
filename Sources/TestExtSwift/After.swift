//
// Created by 和泉田 領一 on 2021/02/05.
//

import Foundation

public struct After<Value> {
    var action: (Value) throws -> ()
}
