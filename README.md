# TestExtSwift

TestExtSwift extends XCTest.

## Features

- Parameterized testing support

## Usage

### Install by SPM

1. Xcode menu [File] -> [Swift Package] -> [Add Package Dependency...]
2. Add TestExtSwift to your unit testing target

### Parameterized testing

```
import TestExtSwift

XCTContext.runActivity(named: "succeeded") {
    (1, 1)
    (2, 2)
} test: { (_, argument, expected) in
  XCTAssertEqual(argument, expected)
}
```

If you return all arguments and expected results used in the third argument 'test' of runActivity(named:sources:test:) method from the second argument 'source' of the method, all arguments and expected results pass to your test code one after another.

```
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

```
XCTContext.runActivity(named: "failed with line") {
  s(1, 2)
  s(2, 3)
} test: { (_, argument, expected, line) in
  XCTAssertEqual(argument, expected, line: line)
}
```

If you want to indicate a line when a test failed, the 's' function generates (Argument, Expected result, Line number) tuple, and the test code can use the line.

```
XCTContext.runActivity(named: "Array", [
    s(1, 1),
    s(2, 2)
]) { (_, arg, expected, line) in
    XCTAssertEqual(argument, expected, line: line)
}
```

Of course, you can pass a sequence object as a source.

### Operators

#### Direct Product Operator

```
1 ** 1       // [(1, 1)]
1 ** [1, 2]     // [(1, 1), (1, 2)]
[1, 2] ** 1     // [(1, 1|, (2, 1)]
[1, 2] ** [3, 4]  // [(1, 3), (1, 4), (2, 3), (2, 4)]
```

You can use this operator for generating arguments case such as `Enum1.allCases ** Enum2.allCases`.
