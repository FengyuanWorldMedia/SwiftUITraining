// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI
//领域特定语言
struct ContentView: View {
    @State private var text: String = "0"
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
            if true {
                Text("Hello, world!")
                    .padding()
            } else {
                TextField("TextField", text: $text)
            }
        }
        Text("Hello, world!")
            .padding()
        Text("Hello, world!")
            .padding()
        TextField("TextField", text: $text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
