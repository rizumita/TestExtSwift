//
// Created by 和泉田 領一 on 2021/02/06.
//

import Foundation

@_functionBuilder
public struct RowBuilder {
    public static func buildBlock<A>(_ a: A, _ line: UInt = #line) -> Row<A> {
        Row(value: a, line: line)
    }

    public static func buildBlock<A, B>(_ a: A, _ b: B, _ line: UInt = #line) -> Row<(A, B)> {
        Row(value: (a, b), line: line)
    }

    public static func buildBlock<A, B, C>(_ a: A, _ b: B, _ c: C, _ line: UInt = #line) -> Row<(A, B, C)> {
        Row(value: (a, b, c), line: line)
    }

    public static func buildBlock<A, B, C, D>(_ a: A,
                                              _ b: B,
                                              _ c: C,
                                              _ d: D,
                                              line: UInt = #line) -> Row<(A, B, C, D)> {
        Row(value: (a, b, c, d), line: line)
    }

    public static func buildBlock<A, B, C, D, E>(_ a: A,
                                                 _ b: B,
                                                 _ c: C,
                                                 _ d: D,
                                                 _ e: E,
                                                 line: UInt = #line) -> Row<(A, B, C, D, E)> {
        Row(value: (a, b, c, d, e), line: line)
    }

    public static func buildBlock<A, B, C, D, E, F>(_ a: A,
                                                    _ b: B,
                                                    _ c: C,
                                                    _ d: D,
                                                    _ e: E,
                                                    _ f: F,
                                                    line: UInt = #line) -> Row<(A, B, C, D, E, F)> {
        Row(value: (a, b, c, d, e, f), line: line)
    }
}
