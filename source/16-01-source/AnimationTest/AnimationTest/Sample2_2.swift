// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

/// 11-38
struct Sample2_2: View {
    @State private var showInfo = false

    var body: some View {
       VStack {
          Button("Show Information") {
             withAnimation {
                self.showInfo.toggle()
             }
          }.padding()
          if showInfo {
             Text("This is the information")
                .transition(.move(edge: .leading))
          }
          Spacer()
       }
    }
}

struct Sample2_2_Previews: PreviewProvider {
    static var previews: some View {
        Sample2_2()
    }
}
