// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import Foundation

@resultBuilder
struct ArrayBuilder {
    typealias Component = [Int]
    typealias Expression = Int
    static func buildExpression(_ element: Expression) -> Component {
        return [element]
    }
    static func buildOptional(_ component: Component?) -> Component {
        guard let component = component else { return [] }
        return component
    }
    static func buildEither(first component: Component) -> Component {
        return component
    }
    static func buildEither(second component: Component) -> Component {
        return component
    }
    static func buildArray(_ components: [Component]) -> Component {
        return Array(components.joined())
    }
    static func buildBlock(_ components: Component...) -> Component {
        return Array(components.joined())
    }
}
//========buildExpression
@ArrayBuilder var builderNumber: [Int] { 10 }
var manualNumber = ArrayBuilder.buildExpression(10)
//========================================================================

/// if you write a switch statement that has three cases,
/// the compiler uses a binary tree with three leaf nodes.
/// Likewise, because the path from the root node to the second case is “second child” and then “first child”,
///  that case becomes a nested call like buildEither(first: buildEither(second: ... ))
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
/// manual conditional
var manualConditional: [Int]
if someNumber < 12 {
    let partialResult = ArrayBuilder.buildExpression(31)
    let outerPartialResult = ArrayBuilder.buildEither(first: partialResult)
    manualConditional = ArrayBuilder.buildEither(first: outerPartialResult)
} else if someNumber == 19 {
    let partialResult = ArrayBuilder.buildExpression(32)
    let outerPartialResult = ArrayBuilder.buildEither(second: partialResult)
    manualConditional = ArrayBuilder.buildEither(first: outerPartialResult)
} else {
    let partialResult = ArrayBuilder.buildExpression(33)
    manualConditional = ArrayBuilder.buildEither(second: partialResult)
}


//==========buildOptional==============================================================
//let someNumber = 19
@ArrayBuilder var builderOptional: [Int] {
    if (someNumber % 2) == 1 { 20 }
}

var partialResult: [Int]? = nil
if (someNumber % 2) == 1 {
    partialResult = ArrayBuilder.buildExpression(20)
}
var manualOptional = ArrayBuilder.buildOptional(partialResult)

//==========buildBlock==============================================================
@ArrayBuilder var builderBlock: [Int] {
    100
    200
    300
}
var manualBlock = ArrayBuilder.buildBlock(
    ArrayBuilder.buildExpression(100),
    ArrayBuilder.buildExpression(200),
    ArrayBuilder.buildExpression(300)
)
//==========buildArray==============================================================
@ArrayBuilder var builderArray: [Int] {
    for i in 5...7 {
        100 + i
    }
}

var temporary: [[Int]] = []
for i in 5...7 {
    let partialResult = ArrayBuilder.buildExpression(100 + i)
    temporary.append(partialResult)
}
let manualArray = ArrayBuilder.buildArray(temporary)


//If the result builder has a buildFinalResult(_:) method, the final result becomes a call to that method. This transformation is always last.


/// https://www.avanderlee.com/swift/result-builders/
//Whenever you see a piece of code that’s built out of several conditional elements and turned into a single common piece of the return type, you could think about writing result builders. However, only do so if you know you need to write it more often.
//
//When you’re writing autolayout constraints in code, you’re doing that in a lot of places. Therefore, it’s worth writing a custom result builder for it.

//https://segmentfault.com/a/1190000037601719


/// https://www.vadimbulavin.com/swift-function-builders-swiftui-view-builder/
/// https://www.youtube.com/watch?v=LKFVcc_uC60
