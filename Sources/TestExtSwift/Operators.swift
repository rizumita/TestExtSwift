//
//  Operators.swift
//  TestExtSwift
//
//  Created by 和泉田 領一 on 2021/01/23.
//

import Foundation

/// Direct product
precedencegroup DirectProductPrecedence {
    higherThan: TestPrecedence
    associativity: right
}

infix operator **: DirectProductPrecedence

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

precedencegroup TestPrecedence {
    higherThan: DefaultPrecedence
    lowerThan: RangeFormationPrecedence
    associativity: left
}

infix operator =>: TestPrecedence

prefix operator ^

public prefix func ^<A>(@RowBuilder _ row: () -> Row<A>) -> Row<A> {
    row()
}
