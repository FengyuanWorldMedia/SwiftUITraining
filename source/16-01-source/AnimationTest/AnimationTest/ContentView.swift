// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {

                NavigationLink ("Sample1_1", destination: Sample1_1())
                NavigationLink ("Sample1_1_2", destination: Sample1_1_2())
                NavigationLink ("Sample1_2", destination: Sample1_2())
                NavigationLink ("Sample1_3", destination: Sample1_3())
                NavigationLink ("Sample2_1", destination: Sample2_1())
                NavigationLink ("Sample2_2", destination: Sample2_2())

                NavigationLink ("Sample2_3_1", destination: Sample2_3_1())
                NavigationLink ("Sample2_3_2", destination: Sample2_3_2())
                NavigationLink ("Sample2_3_3", destination: Sample2_3_3())
                
                NavigationLink ("InterpolatingSpringTest", destination: InterpolatingSpringTest())
                
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
