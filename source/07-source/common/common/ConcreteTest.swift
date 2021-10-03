// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import Foundation

public protocol Shape {
     func draw() -> String
}

public struct Triangle: Shape {
    var size: Int
    
    public init(size : Int) {
        self.size = size
    }
    public func draw() -> String {
        var result = [String]()
        for length in 1...size {
            result.append(String(repeating: "*", count: length))
        }
        return result.joined(separator: "\n")
    }
}
//let smallTriangle = Triangle(size: 3)
//print(smallTriangle.draw())
// *
// **
// ***

public struct FlippedShape<T: Shape>: Shape {
    var shape: T
    public init(shape : T) {
        self.shape = shape
    }
    public func draw() -> String {
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }
}
//let flippedTriangle = FlippedShape(shape: smallTriangle)
//print(flippedTriangle.draw())
// ***
// **
// *


public struct JoinedShape<T: Shape, U: Shape>: Shape {
    var top: T
    var bottom: U
    public init(top: T, bottom: U) {
        self.top = top
        self.bottom = bottom
    }
    public func draw() -> String {
        return top.draw() + "\n" + bottom.draw()
    }
}
//let joinedTriangles = JoinedShape(top: smallTriangle, bottom: flippedTriangle)
//print(joinedTriangles.draw())
// *
// **
// ***
// ***
// **
// *
