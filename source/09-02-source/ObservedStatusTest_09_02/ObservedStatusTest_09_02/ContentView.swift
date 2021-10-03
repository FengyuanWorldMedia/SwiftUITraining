// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
//            Text("Home!")
//                .padding()
            VStack() {
                NavigationLink(
                    destination: StateTestUI(),
                    label: {
                        Text("State Test")
                    }).padding(10)
                
                NavigationLink(
                    destination: BiDirectionTestUI(),
                    label: {
                        Text("State 双向绑定")
                    }).padding(10)
                
                NavigationLink(
                    destination: BindingUITest(),
                    label: {
                        Text("BindingUITest 自定义绑定UI组件")
                    }).padding(10)
            }
        } 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
