// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var envObj1 : EnvObj1
    private var envObj2 = EnvObj2()
    private var envObj3 = EnvObj3()
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: EnvObjeSample1(), label: {
                    Text("Environment object EnvObjeSample1!")
                }).padding(10)
                
                NavigationLink(destination: EnvObjeSample2().environmentObject(envObj2), label: {
                    Text("Environment object EnvObjeSample2!")
                }).padding(10)
                
                NavigationLink(destination: self.getView3(), label: {
                    Text("Environment object EnvObjeSample3!")
                }).padding(10)
            }
        }
    }
    
    private func getView3() -> some View {
        EnvObjeSample3().environmentObject(envObj2)
                        .environmentObject(envObj3)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
