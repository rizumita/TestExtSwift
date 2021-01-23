//
//  Operators.swift
//  TestExtSwift
//
//  Created by 和泉田 領一 on 2021/01/23.
//

import Foundation

/// Direct product
infix operator **

public func **<A, B>(lhs: [A], rhs: [B]) -> [(A, B)] {
    lhs.flatMap { a in
        rhs.map { b in
            (a, b)
        }
    }
}

public func **<A, B>(lhs: A, rhs: [B]) -> [(A, B)] {
    [lhs] ** rhs
}

public func **<A, B>(lhs: [A], rhs: B) -> [(A, B)] {
    lhs ** [rhs]
}

public func **<A, B>(lhs: A, rhs: B) -> [(A, B)] {
    [lhs] ** [rhs]
}
