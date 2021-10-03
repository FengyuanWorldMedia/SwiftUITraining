// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import Foundation
import Combine

//let myPubliser = Just("55")
//
//let myScriber = Subscribers.Sink<String,Never> (receiveCompletion: { completion in
//        if completion == .finished {
//            print("Finished")
//        } else {
//            print("Failure")
//        }
//    }, receiveValue: { value in
//        print(value)
//    })
//let myScriber2 = Subscribers.Sink<String,Never> (receiveCompletion: { completion in
//        if completion == .finished {
//            print("222 Finished")
//        } else {
//            print("222 Failure")
//        }
//    }, receiveValue: { value in
//        print(value)
//    })
//
//myPubliser.subscribe(myScriber)
//myPubliser.subscribe(myScriber2)
//




////https://developer.apple.com/documentation/combine/publishers
//Publishers.Map
//Publishers.Filter
//Publishers.Debounce
//Publishers.RemoveDuplicates
//Publishers.ReceiveOn
//Publishers.TryMap
//Publishers.FlatMap
//Publishers.Catch
//Publishers.CombineLatest
//Publishers.Merge
//Publishers.Zip
//Publishers.Decode
//Publishers.Autoconnect



//let myPubliser2 = Just("55")
//
//let tansValuePubliser = Publishers.Map<Just<String>,Int>(upstream: myPubliser2, transform: {
//    value in
//    return Int(value) ?? 0
//})
//
//let myScriber2 = Subscribers.Sink<Int,Never> (receiveCompletion: { completion in
//        if completion == .finished {
//            print("Finished")
//        } else {
//            print("Failure")
//        }
//    }, receiveValue: { value in
//        print(value)
//    })
//
//tansValuePubliser.subscribe(myScriber2)




Just(55).filter({
    value in
    return value < 100
}).sink(receiveCompletion: { completion in
    if completion == .finished {
        print("Finished")
    } else {
        print("Failure")
    }
}, receiveValue: { value in
    print(value)
})

//let filterPubliser = Publishers.Filter(upstream: myPubliser2, isIncluded: {
//    value in
//        return value < 100
//})
//
//let myScriber2 = Subscribers.Sink<Int,Never> (receiveCompletion: { completion in
//        if completion == .finished {
//            print("Finished")
//        } else {
//            print("Failure")
//        }
//    }, receiveValue: { value in
//        print(value)
//    })
//
//myPubliser2.subscribe(myScriber2)
