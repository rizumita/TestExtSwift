//
// Created by 和泉田 領一 on 2021/02/04.
//

import Foundation
import XCTest

public func src<Source>(@SourcesBuilder _ generate: () -> [Source]) -> [Source] {
    generate()
}

public func param<P, R>(_ name: String = "") -> ParameterizedTesting<P, R> {
    ParameterizedTesting(name: name)
}

//public func param<P1, P2, R>(_ name: String,
//                             _ test: @escaping (XCTActivity, P1, P2) throws -> R) -> (P1, P2) -> Result<R, Error> {
//    { p1, p2 in
//        XCTContext.runActivity(named: name) { activity in
//            Result { try test(activity, p1, p2) }
//        }
//    }
//}
//
//public func param<P1, P2, P3, R>(_ name: String,
//                                 _ test: @escaping (XCTActivity, P1, P2, P3) throws -> R) -> (P1, P2, P3) -> Result<R, Error> {
//    { p1, p2, p3 in
//        XCTContext.runActivity(named: name) { activity in
//            Result { try test(activity, p1, p2, p3) }
//        }
//    }
//}
//
//public func param<P1, P2, P3, P4, R>(_ name: String,
//                                     _ test: @escaping (XCTActivity, P1, P2, P3, P4) throws -> R) -> (P1, P2, P3, P4) -> Result<R, Error> {
//    { p1, p2, p3, p4 in
//        XCTContext.runActivity(named: name) { activity in
//            Result { try test(activity, p1, p2, p3, p4) }
//        }
//    }
//}
//
//public func param<P1, P2, P3, P4, P5, R>(_ name: String,
//                                         _ test: @escaping (XCTActivity, P1, P2, P3, P4, P5) throws -> R) -> (P1, P2, P3, P4, P5) -> Result<R, Error> {
//    { p1, p2, p3, p4, p5 in
//        XCTContext.runActivity(named: name) { activity in
//            Result { try test(activity, p1, p2, p3, p4, p5) }
//        }
//    }
//}
