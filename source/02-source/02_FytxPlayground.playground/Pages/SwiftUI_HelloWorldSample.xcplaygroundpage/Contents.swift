// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import UIKit
import SwiftUI
import PlaygroundSupport

var greeting = "丰源天下传媒，Hello world!"
print("\(greeting)")

struct HelloContentView : View {
    var body: some View {
        VStack {
            Text("丰源天下传媒，Hello world!").background(Color.green)
            Spacer()
            Text("Welcome to SwiftUI").bold().background(Color.purple)
        }
//        .frame(width: UIScreen.main.bounds.width , height:UIScreen.main.bounds.height)
    }
}

//FYTXHelloViewController
var fYTXHelloViewController = UIHostingController(rootView: HelloContentView())
fYTXHelloViewController.view.backgroundColor = .brown
fYTXHelloViewController.view.frame = CGRect(x: 0, y: 0,
                                            width: 500 ,
                                            height: 800 )

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = fYTXHelloViewController




