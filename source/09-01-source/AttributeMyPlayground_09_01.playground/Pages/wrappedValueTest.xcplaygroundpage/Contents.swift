// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import UIKit
import SwiftUI

@propertyWrapper
struct WrapperWithProjection {
    var new = 0
    var wrappedValue: Int {
        didSet {
            if wrappedValue == 9 {
                print("xxxx")
                wrappedValue = 10
                new = 5
            } else {
                print("yyyy")
                new = 3
            }
        }
    }
    var projectedValue: SomeProjection {
        return SomeProjection(wrapper11: self)
    }
}

struct SomeProjection {
    var wrapper11: WrapperWithProjection
}

struct SomeStructTwo {
    @WrapperWithProjection var x = 9
    
    func doSomeThing() {
        var v = SomeStructTwo()
        v.x = 9
        print(v.x)
        print(v._x)
        print(v._x.wrappedValue)
        print(v._x.new)
        v.x = 8
        print(v.$x)
//        print(v._x.projectedValue)
//        print(v._x.wrappedValue)
//        print(v.someValue)
    }
}

var s = SomeStructTwo()
print(s.x)           // Int value
print(s.$x)          // SomeProjection value


s.doSomeThing()

//https://docs.swift.org/swift-book/ReferenceManual/Attributes.html#ID633
//// The synthesized storage for the wrapper has an access control level of private.
//// The projected value has the same access control level as the original wrapped property.

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//@propertyWrapper
//struct SomeWrapper {
//    /// Property wrapper type 'SomeWrapper' does not contain a non-static property named 'wrappedValue'
//    var wrappedValue: Int
//    /// The compiler synthesizes storage for the instance of the wrapper type by prefixing the name of
//    /// the wrapped property with an underscore (_)
//    var someValue: Double
//    init() {
//        self.wrappedValue = 100
//        self.someValue = 12.3
//    }
//    init(wrappedValue: Int) {
//        self.wrappedValue = wrappedValue
//        self.someValue = 45.6
//    }
//    init(wrappedValue value: Int, custom: Double) {
//        self.wrappedValue = value
//        self.someValue = custom
//    }
//}
//
//struct SomeStruct {
//    // Uses init()
//    @SomeWrapper var a: Int
//
//    // Uses init(wrappedValue:)
//    @SomeWrapper var b = 10
//
//    // Both use init(wrappedValue:custom:)
//    @SomeWrapper(custom: 98.7) var c = 30
//    @SomeWrapper(wrappedValue: 30, custom: 98.7) var d
//
//    func doSomeThing() {
//        let v = SomeStruct()
//        print(v.a)
//        print(v._a)
//        print(v._a.someValue)
//        print(v._a.wrappedValue)
////        print(v.someValue)
//    }
//}
////let v = SomeStruct()
////v.doSomeThing()
