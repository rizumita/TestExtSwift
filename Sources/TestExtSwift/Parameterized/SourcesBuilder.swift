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

    public static func buildBlock<A, B>(_ rows: Row<(A, B)>...) -> [Row<(A, B)>] {
        rows
    }

    public static func buildBlock<A, B>(_ rowArray: [Row<(A, B)>]...) -> [Row<(A, B)>] {
        rowArray.flatMap { $0 }
    }

    public static func buildBlock<A, B, C>(_ array: [(A, B, C)]...) -> [(A, B, C)] {
        array.flatMap { $0 }
    }

    public static func buildBlock<A, B, C>(_ array: (A, B, C)...) -> [(A, B, C)] {
        array
    }

    public static func buildBlock<A, B, C>(_ rows: Row<(A, B, C)>...) -> [Row<(A, B, C)>] {
        rows
    }

    public static func buildBlock<A, B, C>(_ rowArray: [Row<(A, B, C)>]...) -> [Row<(A, B, C)>] {
        rowArray.flatMap { $0 }
    }

    public static func buildBlock<A, B, C, D>(_ array: [(A, B, C, D)]...) -> [(A, B, C, D)] {
        array.flatMap { $0 }
    }

    public static func buildBlock<A, B, C, D>(_ array: (A, B, C, D)...) -> [(A, B, C, D)] {
        array
    }

    public static func buildBlock<A, B, C, D>(_ rows: Row<(A, B, C, D)>...) -> [Row<(A, B, C, D)>] {
        rows
    }

    public static func buildBlock<A, B, C, D>(_ rowArray: [Row<(A, B, C, D)>]...) -> [Row<(A, B, C, D)>] {
        rowArray.flatMap { $0 }
    }

    public static func buildBlock<A, B, C, D, E>(_ array: [(A, B, C, D, E)]...) -> [(A, B, C, D, E)] {
        array.flatMap { $0 }
    }

    public static func buildBlock<A, B, C, D, E>(_ array: (A, B, C, D, E)...) -> [(A, B, C, D, E)] {
        array
    }

    public static func buildBlock<A, B, C, D, E>(_ rows: Row<(A, B, C, D, E)>...) -> [Row<(A, B, C, D, E)>] {
        rows
    }

    public static func buildBlock<A, B, C, D, E>(_ rowArray: [Row<(A, B, C, D, E)>]...) -> [Row<(A, B, C, D, E)>] {
        rowArray.flatMap { $0 }
    }

    public static func buildBlock<A, B, C, D, E, F>(_ array: [(A, B, C, D, E, F)]...) -> [(A, B, C, D, E, F)] {
        array.flatMap { $0 }
    }

    public static func buildBlock<A, B, C, D, E, F>(_ array: (A, B, C, D, E, F)...) -> [(A, B, C, D, E, F)] {
        array
    }

    public static func buildBlock<A, B, C, D, E, F>(_ rows: Row<(A, B, C, D, E, F)>...) -> [Row<(A, B, C, D, E, F)>] {
        rows
    }

    public static func buildBlock<A, B, C, D, E, F>(_ rowArray: [Row<(A, B, C, D, E, F)>]...) -> [Row<(A, B, C, D, E, F)>] {
        rowArray.flatMap { $0 }
    }

    public static func buildBlock<A, B, C, D, E, F, G>(_ array: [(A, B, C, D, E, F, G)]...) -> [(A, B, C, D, E, F, G)] {
        array.flatMap { $0 }
    }

    public static func buildBlock<A, B, C, D, E, F, G>(_ array: (A, B, C, D, E, F, G)...) -> [(A, B, C, D, E, F, G)] {
        array
    }

    public static func buildBlock<A, B, C, D, E, F, G>(_ rows: Row<(A, B, C, D, E, F, G)>...) -> [Row<(A, B, C, D, E, F, G)>] {
        rows
    }

    public static func buildBlock<A, B, C, D, E, F, G>(_ rowArray: [Row<(A, B, C, D, E, F, G)>]...) -> [Row<(A, B, C, D, E, F, G)>] {
        rowArray.flatMap { $0 }
    }
}
