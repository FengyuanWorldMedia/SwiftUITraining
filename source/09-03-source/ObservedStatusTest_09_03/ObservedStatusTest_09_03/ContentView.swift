// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct ContentView: View {
    var dataModel:AppDataModel = AppDataModel()
    var body: some View {
        
        NavigationView {
            VStack {
                NavigationLink(destination: SameView(dataModel: dataModel), label: {
                    Text("Observed object SameView!")
                }).padding(10)
                
                NavigationLink(destination: ObservedObjectInnerView(dataModel: dataModel), label: {
                    Text("ObservedObjectInnerView!")
                }).padding(10)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
