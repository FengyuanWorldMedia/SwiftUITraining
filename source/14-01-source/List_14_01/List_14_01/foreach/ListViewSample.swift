// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct ListViewSample: View {
    var body: some View {
        List {
            ForEach(1...10, id: \.self) { value in
               Text("亲爱的读者No: \(value)")
            }
             Section(header: Text("Swift")) {
               Text("var")
               Text("function and method")
               Text("Class and struct")
             }
             Section(header: Text("Swift UI")) {
               Text("UIBasic")
               Text("Layout")
             }
        }.listStyle(GroupedListStyle())
    }
}

struct ListViewSample_Previews: PreviewProvider {
    static var previews: some View {
        ListViewSample()
    }
}
