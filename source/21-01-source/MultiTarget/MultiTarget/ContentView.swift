// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear() {
                print("hello world")
                #if RELEASE
                    print("RELEASE")
                #elseif PRE_RELEASE
                    print("PRE_RELEASE")
                #elseif STAGING
                    print("STAGING")
                #endif
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
