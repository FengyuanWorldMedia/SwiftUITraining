// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

/// 11-40
struct Sample2_3_2: View {
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
                 .transition(AnyTransition.scale.combined(with: .slide))
          }
          Spacer()
       }
    }
}

struct Sample2_3_2_Previews: PreviewProvider {
    static var previews: some View {
        Sample2_3_2()
    }
}
