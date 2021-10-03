// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct NavigationViewTest1: View {
    var body: some View {
//        NavigationView {
            VStack(spacing:15) {
                Text("Hello, World!")
                
                NavigationLink("NavigationViewTest2", destination: NavigationViewTest2())
                
            }.navigationTitle("丰源天下传媒")
//            .navigationBarTitleDisplayMode(.automatic)
//            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitleDisplayMode(.large)
//        }
    }
}

struct NavigationViewTest1_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewTest1()
    }
}
