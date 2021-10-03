// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            VStack(spacing: 10) {
                NavigationLink (
                    destination: AlignmentGuidesSample1(),
                    label: {
                        Text("AlignmentGuidesSample1")
                    })
                NavigationLink (
                    destination: AlignmentGuidesSample2(),
                    label: {
                        Text("AlignmentGuidesSample2")
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
