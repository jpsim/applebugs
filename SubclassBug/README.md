# SubclassBug

## Xcode6-Beta3: Cannot subclass or extend Objective-C classes from same module in Swift

[rdar://17601747](http://openradar.appspot.com/radar?id=5771227683618816)

Please look at `SubclassBug/SwiftFile.swift` for 2 code blocks to uncomment to reproduce this issue.

In a mixed Objective-C/Swift framework, I can't subclass or extend Objective-C classes defined in the framework from Swift. Ex.:

```swift
class MySubclass: ClassDefinedInObjC {} // Fails: Attempting to use the forward class 'ClassDefinedInObjC' as superclass of 'MySubclass'

extension ClassDefinedInObjC {} // Fails: Cannot define category for undefined class 'ClassDefinedInObjC'

func useObjCClass() {
    ClassDefinedInObjC().methodOnClass() // Succeeds
}
```

This worked fine with Xcode6-Beta and Xcode6-Beta2, but doesn't work in Xcode6-Beta3.

## Steps to Reproduce
1. Create a framework in Xcode6-Beta3 containing Objective-C and Swift code
2. Create a subclass of a class defined in the Objective-C code from Swift.

## Expected Results
The framework compiles.

## Actual Results
The framework doesn't compile. Error message varies but can display:

- Attempting to use the forward class 'ClassDefinedInObjC' as superclass of 'MySubclass'
- Cannot define category for undefined class 'ClassDefinedInObjC'
