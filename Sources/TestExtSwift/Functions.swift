//
//  Src.swift
//  TestExtSwift
//
//  Created by 和泉田 領一 on 2021/01/23.
//

import Foundation
import XCTest

public func r<A>(@RowBuilder _ row: () -> Row<A>) -> Row<A> {
    row()
}

public func s<A>(_ a: A, _ line: UInt = #line) -> Row<A> {
    Row(value: a, line: line)
}

public func s<A, B>(_ a: A, _ b: B, _ line: UInt = #line) -> Row<(A, B)> {
    Row(value: (a, b), line: line)
}

public func s<A, B, C>(_ a: A, _ b: B, _ c: C, _ line: UInt = #line) -> Row<(A, B, C)> {
    Row(value: (a, b, c), line: line)
}

public func s<A, B, C, D>(_ a: A, _ b: B, _ c: C, _ d: D, _ line: UInt = #line) -> Row<(A, B, C, D)> {
    Row(value: (a, b, c, d), line: line)
}

public func s<A, B, C, D, E>(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ line: UInt = #line) -> Row<(A, B, C, D, E)> {
    Row(value: (a, b, c, d, e), line: line)
}

public func s<A, B, C, D, E, F>(_ a: A,
                                _ b: B,
                                _ c: C,
                                _ d: D,
                                _ e: E,
                                _ f: F,
                                _ line: UInt = #line) -> Row<(A, B, C, D, E, F)> {
    Row(value: (a, b, c, d, e, f), line: line)
}

public func s<A, B, C, D, E, F, G>(_ a: A,
                                   _ b: B,
                                   _ c: C,
                                   _ d: D,
                                   _ e: E,
                                   _ f: F,
                                   _ g: G,
                                   _ line: UInt = #line) -> Row<(A, B, C, D, E, F, G)> {
    Row(value: (a, b, c, d, e, f, g), line: line)
}
