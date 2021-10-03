// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

//: [Previous](@previous)

import Foundation

/// https://docs.swift.org/swift-book/ReferenceManual/Attributes.html#ID633

protocol Drawable {
    func draw() -> String
}
struct Text: Drawable {
    var content: String
    init(_ content: String) { self.content = content }
    func draw() -> String { return content }
}
struct Line<D: Drawable>: Drawable {
    var elements: [D]
    func draw() -> String {
        return elements.map { $0.draw() }.joined(separator: "")
    }
}
struct DrawEither<First: Drawable, Second: Drawable>: Drawable {
    var content: Drawable
    func draw() -> String { return content.draw() }
}

@resultBuilder
struct DrawingBuilder {
    static func buildBlock<D: Drawable>(_ components: D...) -> Line<D> {
        return Line(elements: components)
    }
    static func buildExpression<D: Drawable>(_ expression: D) -> Line<D> {
        return Line(elements: [expression])
    }
    
    static func buildEither<First, Second>(first: First) -> DrawEither<First, Second> {
            return DrawEither(content: first)
    }
    static func buildEither<First, Second>(second: Second) -> DrawEither<First, Second> {
            return DrawEither(content: second)
    }
}


@available(macOS 99, *)
struct FutureText: Drawable {
    var content: String
    init(_ content: String) { self.content = content }
    func draw() -> String { return content }
}
@DrawingBuilder var brokenDrawing: Drawable {
    if #available(macOS 99, *) {
        FutureText("Inside.future1")  // Problem
    } else {
        Text("Inside.present2")
    }
//    Text("Inside.present3")
}
print(brokenDrawing.draw())
// The type of brokenDrawing is Line<DrawEither<Line<FutureText>, Line<Text>>>


struct AnyDrawable: Drawable {
    var content: Drawable
    func draw() -> String { return content.draw() }
}

extension DrawingBuilder {
    static func buildLimitedAvailability(_ content: Drawable) -> AnyDrawable {
        return AnyDrawable(content: content)
    }
}

@DrawingBuilder var typeErasedDrawing: Drawable {
    if #available(macOS 99, *) {
        FutureText("Inside.future")
    } else {
        Text("Inside.present")
    }
    
}
// The type of typeErasedDrawing is Line<DrawEither<AnyDrawable, Line<Text>>>
//You use the buildLimitedAvailability(_:) method to erase type information that changes depending on which branch is taken.

print("123456789")
