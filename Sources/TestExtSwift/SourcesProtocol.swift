//
//  SourceProtocol.swift
//  TestExtSwift
//
//  Created by 和泉田 領一 on 2021/01/23.
//

import Foundation

public protocol SourcesProtocol {
    associatedtype Argument
    associatedtype ExpectedResult
    associatedtype Line
    
    var sources: [(Argument, ExpectedResult, Line)] { get }
}
