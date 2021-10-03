// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

//: [Previous](@previous)

import Foundation
import Combine

enum MyErrors :Error {
    case wrongVlue
}

let myPubliser = CurrentValueSubject<String,MyErrors>("100")

let mySubscriber = myPubliser.filter({
    return $0.count < 5
}).sink(receiveCompletion: { completion in
    if completion == .failure(MyErrors.wrongVlue) {
        print("MyErrors.wrongVlue")
    } else {
        print(completion)
    }
}, receiveValue: { value in
    print("Value:\(value)")
})


myPubliser.send("h")
myPubliser.send("he")
myPubliser.send("hel")
myPubliser.send("hell")
myPubliser.send("hello")
myPubliser.send("hello,world.")

//myPubliser.send(completion: .finished)
myPubliser.send(completion: .failure(.wrongVlue))
myPubliser.send("hello")

//
//


//enum MyErrors :Error {
//    case wrongVlue
//}
//
//let myPubliser = CurrentValueSubject<String,MyErrors>("100")
//
//let mySubscriber = myPubliser.filter({
//    return $0.count < 5
//}).sink(receiveCompletion: { completion in
//    if completion == .failure(MyErrors.wrongVlue) {
//        print("MyErrors.wrongVlue")
//    } else {
//        print(completion)
//    }
//}, receiveValue: { value in
//    print("Value:\(value)")
//})
//
//myPubliser.send("h")
//myPubliser.send("he")
//myPubliser.send("hel")
//myPubliser.send("hell")
//myPubliser.send("hello")
//myPubliser.send("hello,world.")
//
//myPubliser.send(completion: .finished)
//myPubliser.send(completion: .failure(.wrongVlue))
