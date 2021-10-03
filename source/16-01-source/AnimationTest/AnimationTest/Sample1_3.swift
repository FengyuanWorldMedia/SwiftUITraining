// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI
/// 11-28
struct Sample1_3: View {
    @State private var boxScale: CGFloat = 1

    var body: some View {
       VStack {
          HStack {
             Rectangle()
                 .fill(Color.blue)
                 .frame(width: 50, height: 50)
                 .scaleEffect(boxScale)
                .animation(self.boxScale == 1 ? nil :
                    Animation.interpolatingSpring(mass: 0.2, stiffness: 0.5, damping: 0.5, initialVelocity: 5)
                       .speed(5)
                       .repeatForever()
                 )
          }
          .frame(width: 250, height: 120)
          Button("Animate") {
             self.boxScale = 2
          }
       }.padding()
    }
}

struct Sample1_3_Previews: PreviewProvider {
    static var previews: some View {
        Sample1_3()
    }
}
