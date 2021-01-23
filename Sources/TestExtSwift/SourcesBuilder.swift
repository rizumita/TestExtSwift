//
//  SourcesBuilder.swift
//  TestExtSwift
//
//  Created by 和泉田 領一 on 2021/01/23.
//

import Foundation

@_functionBuilder
public struct SourcesBuilder {
    public static func buildBlock<Argument, ExpectedResult>(_ array: [(Argument, ExpectedResult)]...) -> [(Argument, ExpectedResult)] {
        array.flatMap { $0 }
    }

    public static func buildBlock<Argument, ExpectedResult>(_ array: (Argument, ExpectedResult)...) -> [(Argument, ExpectedResult)] {
        array
    }

    public static func buildBlock<Argument, ExpectedResult>(_ array: [(Argument, ExpectedResult, UInt)]...) -> [(Argument, ExpectedResult, UInt)] {
        array.flatMap { $0 }
    }

    public static func buildBlock<Argument, ExpectedResult>(_ array: (Argument, ExpectedResult, UInt)...) -> [(Argument, ExpectedResult, UInt)] {
        array
    }
}

public func s<Argument, ExpectedResult>(_ argument: Argument, _ expectedResult: ExpectedResult, _ line: UInt = #line) -> (Argument, ExpectedResult, UInt) {
    (argument, expectedResult, line)
}
