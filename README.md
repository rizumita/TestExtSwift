# TestExtSwift

TestExtSwift extends XCTest.

## Features

- Parameterized testing support
- Equivalence class partitioning
- Boundary value analysis

## Usage

### Install by SPM

1. Xcode menu [File] -> [Swift Package] -> [Add Package Dependency...]
2. Add TestExtSwift to your unit testing target

### Parameterized testing

```swift
import TestExtSwift

try
{
    r { 1; 3; false }
    r { 2; 3; true }
    r { 3; 3; false }
} => Parameterized("Parameterized Testing")
    .before { p1, p2, p3 in print("before") }
    .after { p1, p2, p3 in print("after") }
    .test { _, p1, p2, p3, line in
        XCTAssertEqual(p1 + 1 == p2, p3, line: line)
    }

XCTContext.runActivity(named: "succeeded") {
    (1, 1)
    (2, 2)
} test: { (_, arg, expected) in
    XCTAssertEqual(arg, expected)
}
```

```swift
try
[r { 1; 3; false },
 r { 2; 3; true },
 r { 3; 3; false }] => Parameterized("Parameterized Testing")
    .test { _, p1, p2, p3, line in
        XCTAssertEqual(p1 + 1 == p2, p3, line: line)
    }
```

### Equivalence class partitioning and Boundary value analysis

```swift
try (1...100) => ECP("ECP Testing") {
    Valid("Valid case")
        .relation { $0 % 4 == 0 }
        .test { XCTAssertEqual($1 % 2, 0) }

    Invalid("Invalid case 1")
        .relation { $0 % 4 != 0 }
        .test { XCTAssertNotEqual($1 % 4, 0) }

    Invalid("Invalid case 2")
        .representative(1)
        .order { $0 < $1 }
        .relation { $0 == 100 }
        .test { XCTAssertEqual($1, 100) }
}
```

```swift
try XCTContext.runActivity(values: 1...100) {
    Valid("Valid case")
        .relation { $0 % 4 == 0 }
        .test { XCTAssertEqual($1 % 2, 0) }

    Invalid("Invalid case 1")
        .relation { $0 % 4 != 0 }
        .test { XCTAssertNotEqual($1 % 4, 0) }

    Invalid("Invalid case 2")
        .representative(1)
        .order { $0 < $1 }
        .relation { $0 == 100 }
        .test { XCTAssertEqual($1, 100) }
}
```

### Operators

#### Direct Product Operator

```
1 ** 1       // [(1, 1)]
1 ** [1, 2]     // [(1, 1), (1, 2)]
[1, 2] ** 1     // [(1, 1|, (2, 1)]
[1, 2] ** [3, 4]  // [(1, 3), (1, 4), (2, 3), (2, 4)]
```

You can use this operator for generating arguments case such as `Enum1.allCases ** Enum2.allCases`.
