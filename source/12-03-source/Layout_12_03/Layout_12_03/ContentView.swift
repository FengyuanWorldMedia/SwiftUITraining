// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            VStack(spacing: 20){
                NavigationLink(
                    destination: ScrollViewReaderSample(),
                    label: {
                        Text("ScrollViewReaderSample")
                    })
                NavigationLink(
                    destination: PreferenceSampleView(),
                    label: {
                        Text("PreferenceSampleView")
                    })
                NavigationLink(
                    destination: CustomViewContainerSampleTest(),
                    label: {
                        Text("CustomViewContainerSampleTest")
                    })
//                NavigationLink(
//                    destination: ImagePager(),
//                    label: {
//                        Text("ImagePager")
//                    })
                NavigationLink(
                    destination: PageView(),
                    label: {
                        Text("PageView")
                    }) 
                NavigationLink(
                    destination: Rotation3DEffectTest(),
                    label: {
                        Text("Rotation3DEffectTest")
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
