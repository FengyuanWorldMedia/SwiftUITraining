// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import Foundation

class AttributeTestClass {
    
    @discardableResult
    func getValue() -> Int {
        print("test discardableResult")
        return 1
    }
    func getValue2() -> Int {
        print("test discardableResult")
        return 1
    }
    
}

fileprivate func testBlock(executeBlock: @escaping () -> Void) {
    executeBlock()
}

class TestClient {
    
    @available(*, unavailable, renamed: "MyRenamedProtocol")
    typealias MyProtocol = MyRenamedProtocol
    
    class func execute() {
        testBlock {
            let attribute = AttributeTestClass()
            attribute.getValue()
            
            /// Result of call to 'getValue2()' is unused
            attribute.getValue2()
            
            /// 'MyProtocol' has been renamed to 'MyRenamedProtocol'
            var p : MyRenamedProtocol
            
            /// 'MyClass' is only available in iOS 15.0 or newer
            var myClass = MyClass()
            
            /// 'MyStruct' is unavailable
            var myStruct = MyStruct()
            
            let dial = TelephoneExchange()
            // Use a dynamic method call.
            dial(4, 1, 1)
            // Prints "Get Swift help on forums.swift.org"
            dial(8, 6, 7, 5, 3, 0, 9)
            // Prints "Unrecognized number"
            // Call the underlying method directly.
            dial.dynamicallyCall(withArguments: [4, 1, 1])
            
            let repeatLabels = Repeater()
            print(repeatLabels(a: 1, b: 2, c: 3, b: 2, a: 1))
            
            let s = DynamicStruct()
            // Use dynamic member lookup.
            let dynamic = s.someOtherMember // or s.someDynamicMember
            print(dynamic)
            // Prints "325"
            // Call the underlying subscript directly.
            let equivalent = s[dynamicMember: "someDynamicMember"]
            print(dynamic == equivalent)
            // Prints "true"
            
            let point = Point(x: 381, y: 431)
            // key Path
            print(point[keyPath: \Point.x])
//            let wrapper = PassthroughWrapper<Point>(value: point)
            let wrapper = PassthroughWrapper(value: point)
            print(wrapper.x)
            // Call the underlying subscript directly.
            print(wrapper[dynamicMember: \Point.x])
            
            /// #available
            /// Marking pieces of code as available per platform or version is required
            if #available(iOS 14, *) {
                print("This code only runs on iOS 14 and up")
            } else {
                print("This code only runs on iOS 13 and lower")
            }
            guard #available(iOS 14, *) else {
                print("Returning if iOS 13 or lower")
                return
            }
             
        }
    }
}


// First release
protocol MyProtocol {
    // protocol definition
}
// Subsequent release renames MyProtocol
protocol MyRenamedProtocol {
    // protocol definition
}


@available(iOS 13.0, macOS 10.12, *)
class MyClass {
    // class definition
}

@available(swift 5.1) /// 5.5  or 3.3
@available(macOS 10.12, *)
struct MyStruct {
    // struct definition
}

/// Apply this attribute to a class, structure, enumeration, or protocol to treat instances of the type as callable functions.
@dynamicCallable
struct TelephoneExchange {
    /// 这个方法名是必须的。
    func dynamicallyCall(withArguments phoneNumber: [Int]) {
        if phoneNumber == [4, 1, 1] {
            print("Get Swift help on forums.swift.org")
        } else {
            print("Unrecognized number")
        }
    }
}

@dynamicCallable
struct Repeater {
    /// 这个方法名是必须的。
    /// The declaration of the dynamicallyCall(withArguments:) method must have a single parameter that conforms to the ExpressibleByArrayLiteral
    /// https://developer.apple.com/documentation/swift/expressiblebyarrayliteral
    func dynamicallyCall(withKeywordArguments pairs: KeyValuePairs<String, Int>) -> String {
        return pairs
            .map { label, count in
                repeatElement(label, count: count).joined(separator: " ")
            }.joined(separator: "\n")
    }
}


/// Apply this attribute to a class, structure, enumeration, or protocol to enable members to be looked up by name at runtime.
///  The type must implement a subscript(dynamicMember:) subscript.
@dynamicMemberLookup
struct DynamicStruct {
    let dictionary = ["someDynamicMember": 325,
                      "someOtherMember": 787]
    subscript(dynamicMember member: String) -> Int {
        return dictionary[member] ?? 1054
    }
}


struct Point { var x, y: Int }

@dynamicMemberLookup
struct PassthroughWrapper<Value> {
    var value: Value
    subscript<T>(dynamicMember member: KeyPath<Value, T>) -> T {
        get { return value[keyPath: member] }
    }
}


class ExampleClass: NSObject {
    @objc var enabled: Bool {
        @objc(isEnabled) get { /// 这个表示 如果在OC中的话，可以使用 isEnabled 获取。
            // Return the appropriate value
        }
    }
}
