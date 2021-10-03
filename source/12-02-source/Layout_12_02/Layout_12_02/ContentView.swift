// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 10.0) {
                NavigationLink(
                    destination: SpacerSample(),
                    label: {
                        Text("SpacerSample")
                    })
                NavigationLink(
                    destination: SafeAreaSample(),
                    label: {
                        Text("SafeAreaSample")
                    })
                NavigationLink(
                    destination: LayoutPrioritySample(),
                    label: {
                        Text("LayoutPrioritySample")
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
