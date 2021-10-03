// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct NavigationViewTest2: View {
    
    var body: some View {
            VStack(spacing:15) {
                Text("Hello, World!")
            }.navigationTitle("丰源天下传媒")
//            .navigationBarTitleDisplayMode(.automatic)
            .navigationBarTitleDisplayMode(.large)
//            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems( leading:
                                Button("Login") {
                                },
                                trailing:
                                    HStack {
                                        Button("More") {
                                           
                                        }
                                        Button("Logout") {
                                        }
                                    }
                            )
    }
}

struct NavigationViewTest2_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewTest2()
    }
}
