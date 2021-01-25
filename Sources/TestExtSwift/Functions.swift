//
//  Src.swift
//  TestExtSwift
//
//  Created by 和泉田 領一 on 2021/01/23.
//

import Foundation

public func s<Argument>(_ argument: Argument, _ line: UInt = #line) -> (Argument, UInt) {
    (argument, line)
}

public func s<Argument, ExpectedResult>(_ argument: Argument, _ expectedResult: ExpectedResult, _ line: UInt = #line) -> (Argument, ExpectedResult, UInt) {
    (argument, expectedResult, line)
}

public func src<Source>(@SourcesBuilder _ generate: () -> [Source]) -> [Source] {
    generate()
}
