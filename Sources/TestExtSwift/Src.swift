//
//  Src.swift
//  TestExtSwift
//
//  Created by 和泉田 領一 on 2021/01/23.
//

import Foundation

public struct Src<Argument, ExpectedResult, Line>: SourcesProtocol {
    public init(@SourcesBuilder _ generate: () -> [(Argument, ExpectedResult, Line)]) {
        sources = generate()
    }

    public var sources: [(Argument, ExpectedResult, Line)]
}
