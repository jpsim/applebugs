//
//  SwiftFile.swift
//  SubclassBug
//
//  Created by JP Simard on 7/10/14.
//  Copyright (c) 2014 JP Simard. All rights reserved.
//

////////////////////////////////////////
// Issue #1: Cannot subclass Objective-C classes from the same framework
//           Uncommenting this prevents the framework from building
////////////////////////////////////////

// class SwiftSubclassPublicClass: PublicClass {}

////////////////////////////////////////
// Issue #2: Cannot extend Objective-C classes from the same framework
//           Uncommenting this prevents the framework from building
////////////////////////////////////////

// extension PublicClass {}

// Extending or subclassing Objective-C classes from outside the framework succeeds
class SwiftSubclassNSOjbect: NSObject {}
extension NSObject {}

class SwiftClass {
    // We can use Objective-C classes here without issue
    var publicClass = PublicClass()

    func doSomethingWithPublicClass() {
        // We can call methods on Objective-C classes here without issue
        println("we can call the public class: \(publicClass.returnAString())")
    }
}
