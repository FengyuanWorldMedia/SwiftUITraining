// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

//: [Previous](@previous)

import Foundation

@propertyWrapper
struct WrapperSomeStructData {
    
    var new : Int = 0
    
    var wrappedValue: Int {
        didSet {
            if wrappedValue <= 9 {
                print("xxxx")
                wrappedValue = 0
                new = 5
            } else {
                new = wrappedValue
            }
        }
    }
    
    var projectedValue: SomeDataProjection {
        return SomeDataProjection(wrapper11: self)
    }
    
}

struct SomeDataProjection {
    var wrapper11: WrapperSomeStructData
}


struct SomeStructData {
    
    @WrapperSomeStructData var x : Int = 9
    
    func doSomeThing() {
        var v = SomeStructData()
        print(v.x)
        v.x = 8
        print(v.x)
        print(v.$x)
        print(v._x)
        print("wrappedValue\(v._x)") //  WrapperSomeStructData
        print("wrappedValue: \(v._x.wrappedValue)")
        print("wrappedValue: \(v._x.new)")
//        print("wrappedValue: \(v.$x)")
        v.x = 100
        print(v.x)
        print("wrappedValue: \(v._x.wrappedValue)")
    }
}


var data = SomeStructData()
data.x
//data._x
data.$x
data.doSomeThing()
