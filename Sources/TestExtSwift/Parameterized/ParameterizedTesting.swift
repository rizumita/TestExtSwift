//
// Created by 和泉田 領一 on 2021/02/05.
//

import Foundation
import XCTest

public class ParameterizedTesting<P, R> {
    let name:   String
    var params: [Row<P>] = []
    var before: Before<P>?
    var after:  After<P>?
    var test:   Test<P, R>?
    var isTested         = false

    public init(name: String) { self.name = name }

    deinit {
        assert(isTested, "ParameterizedTesting '\(name)' isn't tested")
    }

    func runTests() throws -> [Result<R, Error>] {
        if let before = before {
            try params.map { $0.value }.forEach(before.action)
        }

        var result = [Result<R, Error>]()
        if let test = test {
            result = params.map { params in
                XCTContext.runActivity(named: name) { activity in
                    Result { try test(activity, params.value, params.line) }
                }
            }

            isTested = true
        }

        if let after = after {
            try params.map { $0.value }.forEach(after.action)
        }

        return result
    }
}
