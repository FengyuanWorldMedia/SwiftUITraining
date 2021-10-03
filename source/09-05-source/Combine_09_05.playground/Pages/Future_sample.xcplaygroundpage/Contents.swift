// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

//: [Previous](@previous)

import Foundation
import Combine

let myPubliser = Future<Int, Never> { promise in
    //异步执行 耗时操作
    print("i will promise soon")
    promise(.success(100))
}

let myScriber = Subscribers.Sink<Int,Never> (receiveCompletion: { completion in
        if completion == .finished {
            print("Finished")
        } else {
            print("Failure")
        }
    }, receiveValue: { value in
        print(value)
    })
let myScriber2 = Subscribers.Sink<Int,Never> (receiveCompletion: { completion in
        if completion == .finished {
            print("222 Finished")
        } else {
            print("222 Failure")
        }
    }, receiveValue: { value in
        print(value)
    })

myPubliser.subscribe(myScriber)

//: [Next](@next)
