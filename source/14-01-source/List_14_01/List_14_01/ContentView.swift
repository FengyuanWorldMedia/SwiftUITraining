// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                
               NavigationLink(
                destination: ListViewSample2(),
                label: {
                    Text("ListViewSample2")
                })
                NavigationLink(
                 destination: ListViewSample3(),
                 label: {
                     Text("ListViewSample3")
                 })
                NavigationLink(
                 destination: ListViewSample(),
                 label: {
                     Text("ListViewSample")
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
