// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing:15) {
                Text("Hello, World!")
                   // .navigationTitle("丰源天下传媒")  优先级高
                Text("Hello, World!")
                   // .navigationTitle("丰源天下传媒2")  优先级中
                
                NavigationLink("Test1", destination: NavigationViewTest1())
                
                NavigationLink("Test2", destination: NavigationViewTest2())
                
                NavigationLink("Test3", destination: NavigationViewTest3())
                
                
            }.navigationTitle("丰源天下传媒") // 优先级低
            .navigationBarTitleDisplayMode(.inline)
             
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
