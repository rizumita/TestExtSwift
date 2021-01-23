//
//  Src.swift
//  TestExtSwift
//
//  Created by 和泉田 領一 on 2021/01/23.
//

import Foundation

public struct Src<Source>: SourcesProtocol {
    public init(@SourcesBuilder _ generate: () -> [Source]) {
        sources = generate()
    }
    
    public var sources: [Source]
}
