// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack (spacing: 15){
                NavigationLink (
                    destination: ImagePicker(),
                    label: {
                        Text("图片选择")
                    })
                NavigationLink (
                    destination: TextInputSample(),
                    label: {
                        Text("文字编辑选择")
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
