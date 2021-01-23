//
//  Array+SourcesProtocol.swift
//  TestExtSwift
//
//  Created by 和泉田 領一 on 2021/01/23.
//

import Foundation

extension Array: SourcesProtocol {
    public typealias Source = Element

    public var sources: [Element] {
        self
    }
}
