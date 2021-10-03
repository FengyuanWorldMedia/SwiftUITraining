// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 15) { 

                NavigationLink ("Sample1_1View", destination: Sample1_1View())
                NavigationLink ("Sample1_2View", destination: Sample1_2View())
                NavigationLink ("Sample1_3_1View", destination: Sample1_3_1View())
                NavigationLink ("Sample1_3_2View", destination: Sample1_3_2View())
                NavigationLink ("Sample2_1_1View", destination: Sample2_1_1View())
                NavigationLink ("Sample2_1_2View", destination: Sample2_1_2View())
                NavigationLink ("Sample2_1_3View", destination: Sample2_1_3View().environmentObject(AppData()))

                NavigationLink ("Sample2_2View", destination: Sample2_2View())
                NavigationLink ("Sample2_3View", destination: Sample2_3View())
                
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
