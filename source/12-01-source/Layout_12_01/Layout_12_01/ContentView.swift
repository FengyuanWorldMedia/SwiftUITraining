// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 10.0) {
                NavigationLink(
                    destination: FrameViewTest(),
                    label: {
                        Text("FrameViewTest")
                    })
                NavigationLink(
                    destination: VStackTest01(),
                    label: {
                        Text("VStackTest01")
                    })
                NavigationLink(
                    destination: HStackView01(),
                    label: {
                        Text("HStackView01")
                    })
                NavigationLink(
                    destination: ZStackView01(),
                    label: {
                        Text("ZStackView01")
                    })
                NavigationLink(
                    destination: CustomViewContainer2Test(),
                    label: {
                        Text("CustomViewContainer2Test")
                    })
            }
        }.background(Color.gray)
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
