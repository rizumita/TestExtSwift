//
//  SourcesBuilder.swift
//  TestExtSwift
//
//  Created by 和泉田 領一 on 2021/01/23.
//

import Foundation

@_functionBuilder
public struct SourcesBuilder {
    public static func buildBlock<T>(_ array: [T]...) -> [T] {
        array.flatMap { $0 }
    }

    public static func buildBlock<T>(_ array: T...) -> [T] {
        array
    }
}
