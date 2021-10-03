// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import Foundation

public protocol OShape {
     func draw() -> String
}

public struct OTriangle: OShape {
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
    
    public func reverseShape() -> some OShape {
        return OFlippedShape(shape: self)
    }
}
 
struct OFlippedShape<T: OShape>: OShape {
    var shape: T
    init(shape : T) {
        self.shape = shape
    }
    func draw() -> String {
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }
}

struct OJoinedShape<T: OShape, U: OShape>: OShape { //
    var top: T
    var bottom: U
    init(top: T, bottom: U) {
        self.top = top
        self.bottom = bottom
    }
    func draw() -> String {
        return top.draw() + "\n" + bottom.draw()
    }
}

public func joinShapes<T: OShape, U: OShape>(partOne: T, partTwo: U)  -> some OShape {
    return OJoinedShape(top: partOne, bottom: partTwo)
}
