//
// Created by 和泉田 領一 on 2021/02/04.
//

import Foundation
import XCTest

public func src<Source>(@SourcesBuilder _ generate: () -> [Source]) -> [Source] {
    generate()
}
