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

XCTContext.runActivity(named: "succeeded", [
    (1, 1),
    (2, 2)
]) { (_, argument, expected) in
  XCTAssertEqual(argument, expected)
}

XCTContext.runActivity(named: "succeeded") {
    (1, 1)
    (2, 2)
} test: { (_, argument, expected) in
  XCTAssertEqual(argument, expected)
}
```

If you return all arguments and expected results used in the third argument 'test' of runActivity(named:sources:test:) method from the second argument 'source' of the method, all arguments and expected results pass to your test code one after another.

```swift
XCTContext.runActivity(named: "multiple arrays succeeded") {
  [(1, 1),
   (2, 2)]
  [(3, 3),
   (4, 4)]
} test: { (_, argument, expected) in
  XCTAssertEqual(argument, expected)
}
```

If you want various segmented pairs of argument and expected result, you can return arrays of argument and expected result tuple.

```swift
XCTContext.runActivity(named: "failed with line", [
  s(1, 2),
  s(2, 3)
]) { (_, argument, expected, line) in
  XCTAssertEqual(argument, expected, line: line)
}

XCTContext.runActivity(named: "failed with line") {
  s(1, 2)
  s(2, 3)
} test: { (_, argument, expected, line) in
  XCTAssertEqual(argument, expected, line: line)
}
```

If you want to indicate a line when a test failed, the 's' function generates (Argument, Expected result, Line number) tuple, and the test code can use the line.

```swift
XCTContext.runActivity(named: "Array", [
    s(1, 1),
    s(2, 2)
]) { (_, arg, expected, line) in
    XCTAssertEqual(argument, expected, line: line)
}
```

Setting up

```swift
XCTContext.runActivity(named: "setUp", [
    s(1, 1),
    s(2, 2)
]) { arg in
    print("setUp: \(arg)")
} test: { (_, arg, expected, line) in }
```

Of course, you can pass a sequence object as a source.

### Equivalence class partitioning and Boundary value analysis

```swift
try (1...100) => {
    valid("Valid case")
    => { $0 % 4 == 0 }                  // relation
    => { XCTAssertEqual($1 % 4, 0) }    // test

    invalid("Invalid case", representative: 100, order: { $0 <= $1 })
    => { $0 % 4 != 0 }                  // relation
    => { XCTAssertNotEqual($1 % 4, 0) } // test
}
```

```swift
try XCTContext.runActivity(
    values: 1...100,
    partitions: .valid(name: "Valid case") { $0 % 4 == 0 } test: { _, value in
        XCTAssertEqual(value % 2, 0)
    },
    .invalid(name: "Invalid case1") { $0 % 4 != 0 } test: { _, value in
        XCTAssertNotEqual(value % 4, 0)
    },
    .invalid(name: "Invalid case2",
             representative: 1,
             boundary: { (value1: Int, value2: Int) in value1 < value2 },
             relation: { (value: Int) in value == 100 },
             test: { (_, value: Int) in XCTAssertEqual(value, 100) })
)
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
