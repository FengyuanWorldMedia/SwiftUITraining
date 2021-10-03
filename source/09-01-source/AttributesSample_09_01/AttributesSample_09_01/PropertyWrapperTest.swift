// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import Foundation
//======================================================================================================
@propertyWrapper
struct SomeWrapper {
    /// Property wrapper type 'SomeWrapper' does not contain a non-static property named 'wrappedValue'
    var wrappedValue: Int
    /// The compiler synthesizes storage for the instance of the wrapper type by prefixing the name of
    /// the wrapped property with an underscore (_)
    var someValue: Double
    init() {
        self.wrappedValue = 100
        self.someValue = 12.3
    }
    init(wrappedValue: Int) {
        self.wrappedValue = wrappedValue
        self.someValue = 45.6
    }
    init(wrappedValue value: Int, custom: Double) {
        self.wrappedValue = value
        self.someValue = custom
    }
}

struct SomeStruct {
    // Uses init()
    @SomeWrapper var a: Int

    // Uses init(wrappedValue:)
    @SomeWrapper var b = 10

    // Both use init(wrappedValue:custom:)
    @SomeWrapper(custom: 98.7) var c = 30
    @SomeWrapper(wrappedValue: 30, custom: 98.7) var d

    func doSomeThing() {
        let v = SomeStruct()
        print(v.a)
        print(v._a)
        print(v._a.someValue)
        print(v._a.wrappedValue)
//        100
//        SomeWrapper(wrappedValue: 100, someValue: 12.3)
//        12.3
//        100
    }
}
//======================================================================================================

@propertyWrapper
struct WrapperWithProjection {
    var wrappedValue: Int
    /// Value of type 'SomeStructTwo' has no member '$x'
    var projectedValue: SomeProjection {
        return SomeProjection(wrapper: self)
    }
}

struct SomeProjection {
    var wrapper: WrapperWithProjection
}

struct SomeStructTwo {
    @WrapperWithProjection var x = 123
}

class TestClientFroWrapperValue {
    
    private func execute() {
        let s = SomeStructTwo()
        s.x           // Int value
        s.$x          // SomeProjection value
        s.$x.wrapper  // WrapperWithProjection value
//        9
//        SomeProjection(wrapper: __lldb_expr_23.WrapperWithProjection(wrappedValue: 9))
//        WrapperWithProjection(wrappedValue: 9)
    }
}




