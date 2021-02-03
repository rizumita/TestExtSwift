//
// Created by 和泉田 領一 on 2021/02/03.
//

import Foundation
import XCTest

public func valid<Value>(_ name: String,
                         representative: Int = 100,
                         order: ((Value, Value) throws -> Bool)? = { $0 <= $1 })
        -> (Bool, String, Int, ((Value, Value) throws -> Bool)?) where Value: Comparable {
    (true, name, representative, order)
}

public func valid<Value>(_ name: String,
                         representative: Int = 100,
                         order: ((Value, Value) throws -> Bool)? = .none)
        -> (Bool, String, Int, ((Value, Value) throws -> Bool)?) {
    (true, name, representative, order)
}

public func invalid<Value>(_ name: String,
                         representative: Int = 100,
                         order: ((Value, Value) throws -> Bool)? = { $0 <= $1 })
        -> (Bool, String, Int, ((Value, Value) throws -> Bool)?) where Value: Comparable {
    (false, name, representative, order)
}

public func invalid<Value>(_ name: String,
                         representative: Int = 100,
                         order: ((Value, Value) throws -> Bool)? = .none)
        -> (Bool, String, Int, ((Value, Value) throws -> Bool)?) {
    (false, name, representative, order)
}

public func relation<Value>(_ rel: @escaping (Value) throws -> Bool) -> (Value) throws -> Bool {
    rel
}

public func test<Value>(_ t: @escaping (XCTActivity, Value) throws -> ()) -> (XCTActivity, Value) throws -> () {
    t
}
