// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack(spacing:10) {
                NavigationLink(
                    destination: GeometryReaderSample1(),
                    label: {
                        Text("GeometryReaderSample1")
                    })
                NavigationLink(
                    destination: GeometryReaderSample2(),
                    label: {
                        Text("GeometryReaderSample2")
                    })
                NavigationLink(
                    destination: GeometryReaderSample3(),
                    label: {
                        Text("GeometryReaderSample3")
                    })
                NavigationLink(
                    destination: GeometryReaderSample4(),
                    label: {
                        Text("GeometryReaderSample4")
                    })
                NavigationLink(
                    destination: GeometryReaderSample5(),
                    label: {
                        Text("GeometryReaderSample5")
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
