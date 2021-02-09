//
//  SourcesBuilder.swift
//  TestExtSwift
//
//  Created by 和泉田 領一 on 2021/01/23.
//

import Foundation

@_functionBuilder
public struct SourcesBuilder {
    public static func buildBlock<A>(_ array: [A]...) -> [A] {
        array.flatMap { $0 }
    }

    public static func buildBlock<A>(_ array: A...) -> [A] {
        array
    }

    public static func buildBlock<A>(_ rows: Row<A>...) -> [Row<A>] {
        rows
    }

    public static func buildBlock<A>(_ rowArray: [Row<A>]...) -> [Row<A>] {
        rowArray.flatMap { $0 }
    }

    public static func buildBlock<A, B>(_ array: [(A, B)]...) -> [(A, B)] {
        array.flatMap { $0 }
    }

    public static func buildBlock<A, B>(_ array: (A, B)...) -> [(A, B)] {
        array
    }

    public static func buildBlock<A, B, C>(_ array: [(A, B, C)]...) -> [(A, B, C)] {
        array.flatMap { $0 }
    }

    public static func buildBlock<A, B, C>(_ array: (A, B, C)...) -> [(A, B, C)] {
        array
    }

    public static func buildBlock<A, B, C, D>(_ array: [(A, B, C, D)]...) -> [(A, B, C, D)] {
        array.flatMap { $0 }
    }

    public static func buildBlock<A, B, C, D>(_ array: (A, B, C, D)...) -> [(A, B, C, D)] {
        array
    }
}
