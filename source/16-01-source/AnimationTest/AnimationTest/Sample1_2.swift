// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI
/// 11-27
struct Sample1_2: View {
    @State private var boxScale: CGFloat = 1

    var body: some View {
       VStack {
          HStack {
             Rectangle()
                 .fill(Color.blue)
                 .frame(width: 50, height: 50)
                 .scaleEffect(boxScale)
                .animation( self.boxScale == 1 ? nil :
                    Animation.easeInOut(duration: 1)
                       .delay(5)
                       .repeatCount(3)
                 )
          }
          .frame(width: 250, height: 120)
          Button("Animate") {
            if self.boxScale == 2 {
                self.boxScale = 1
            } else {
                self.boxScale = 2
            }
          }
       }.padding()
    }
}

struct Sample1_2_Previews: PreviewProvider {
    static var previews: some View {
        Sample1_2()
    }
}
