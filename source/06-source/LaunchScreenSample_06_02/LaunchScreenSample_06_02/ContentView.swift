// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct ContentView: View {
    var body: some View {

        NavigationView {
            VStack {
                Text("Hello, world!")
                    .padding()
                
                NavigationLink(destination: ContentView2(), label: {
                    Text("View 2!")
                        .padding()
                })
            }
        } 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
