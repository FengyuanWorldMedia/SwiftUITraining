// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

//: [Previous](@previous)

import Foundation

@resultBuilder
struct ArrayBuilder {
    typealias Component = [Int]
    typealias Expression = Int
    /// 必须要 实现。
    static func buildBlock(_ components: Component...) -> Component {
        //  return Array(components.joined())
        components.flatMap({$0})
    }
    /// 支持，单个元素
    static func buildExpression(_ element: Expression) -> Component {
        return [element]
    }
    //// 这个是需要重写
    //    static func buildExpression(_ components: Component...) -> Component {
    //        return Array(components.flatMap({$0}).joined())
    //    }
    /// 支持，多个元素
    static func buildExpression(_ components: Component) -> Component {
        return Array(components.flatMap({$0}))
    }
    
    static func buildExpression(_ param :(Int,Character)) -> Component {
        let times = param.0
        let intValue = Int(String(param.1)) ?? -1
        var result : Component = []
        for _ in 1...times {
            result.append(intValue)
        }
        return result
    }
    
    /// 支持 IF
    static func buildOptional(_ component: Component?) -> Component {
        guard let component = component else { return [] }
        return component
    }
    
    /// 支持 IF-ELSE
    static func buildEither(first component: Component) -> Component {
        return component
    }
    static func buildEither(second component: Component) -> Component {
        return component
    }
    
    /// 支持 for
    static func buildArray(_ components: [Component]) -> Component {
        return Array(components.joined())
    }
     
//
//    public static func buildLimitedAvailability(_ component: ArrayBuilder.Component) -> ArrayBuilder.Component {
//        <#code#>
//    }
    

}


let outArray0 : [Int] = [1,2]
let outArray1 : [Int] = [3,4]
let outArray2 : [Int] = [5,6]
//outArray[0] = 1
//outArray[1] = 2

// ======buildBlock ====
@ArrayBuilder var intArray : [Int] {
    0
    (Int("1") ?? 0)
}

//// static func buildArray(_ components: [Component]...) -> Component
@ArrayBuilder var intArray2 : [Int] {
    outArray0
    outArray1
    outArray2
    for i in 1...10 {
        i
    }
//    static func buildExpression(_ param :(Int,Character)) -> Component {
    (4, "5")
}


for i in intArray2 {
    print(i)
}

//
////========buildExpression
@ArrayBuilder var builderNumber: [Int] {
    10
}

var manualNumber = ArrayBuilder.buildExpression(10)
////========================================================================
//
///// if you write a switch statement that has three cases,
///// the compiler uses a binary tree with three leaf nodes.
///// Likewise, because the path from the root node to the second case is “second child” and then “first child”,
/////  that case becomes a nested call like buildEither(first: buildEither(second: ... ))
let someNumber = 19
@ArrayBuilder var builderConditional: [Int] {
    if someNumber < 12 {
        31
    } else if someNumber == 19 {
        32
    } else {
        33
    }
}
///// manual conditional
//var manualConditional: [Int]
//if someNumber < 12 {
//    let partialResult = ArrayBuilder.buildExpression(31)
//    let outerPartialResult = ArrayBuilder.buildEither(first: partialResult)
//    manualConditional = ArrayBuilder.buildEither(first: outerPartialResult)
//} else if someNumber == 19 {
//    let partialResult = ArrayBuilder.buildExpression(32)
//    let outerPartialResult = ArrayBuilder.buildEither(second: partialResult)
//    manualConditional = ArrayBuilder.buildEither(first: outerPartialResult)
//} else {
//    let partialResult = ArrayBuilder.buildExpression(33)
//    manualConditional = ArrayBuilder.buildEither(second: partialResult)
//}
//
//
////==========buildOptional==============================================================
////let someNumber = 19
@ArrayBuilder var builderOptional: [Int] {
    if (someNumber % 2) == 1 { 20 }
}
//
//var partialResult: [Int]? = nil
//if (someNumber % 2) == 1 {
//    partialResult = ArrayBuilder.buildExpression(20)
//}
//var manualOptional = ArrayBuilder.buildOptional(partialResult)
//
////==========buildBlock==============================================================
@ArrayBuilder var builderBlock: [Int] {
    100
    200
    300
}
//var manualBlock = ArrayBuilder.buildBlock(
//    ArrayBuilder.buildExpression(100),
//    ArrayBuilder.buildExpression(200),
//    ArrayBuilder.buildExpression(300)
//)
////==========buildArray==============================================================
        //let outArray0 : [Int] = [1,2]
        //let outArray1 : [Int] = [3,4]
        //let outArray2 : [Int] = [5,6]
        //@ArrayBuilder var builderArray1: [Int] {
        //    outArray0
        ////    outArray1
        ////    outArray2
        //}
        //
        //for i in builderArray1 {
        //    print(i)
        //}

@ArrayBuilder var builderArray: [Int] {
    for i in 5...7 {
        100 + i
    }
}
for i in builderArray {
    print(i)
}
//
//var temporary: [[Int]] = []
//for i in 5...7 {
//    let partialResult = ArrayBuilder.buildExpression(100 + i)
//    temporary.append(partialResult)
//}
//let manualArray = ArrayBuilder.buildArray(temporary)
//
//
////If the result builder has a buildFinalResult(_:) method, the final result becomes a call to that method. This transformation is always last.
//
//
///// https://www.avanderlee.com/swift/result-builders/
////Whenever you see a piece of code that’s built out of several conditional elements and turned into a single common piece of the return type, you could think about writing result builders. However, only do so if you know you need to write it more often.
////
////When you’re writing autolayout constraints in code, you’re doing that in a lot of places. Therefore, it’s worth writing a custom result builder for it.
//
//
//
