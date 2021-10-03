// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

/// 11-32
struct Sample1_1: View {
    @State private var roundCorners: Bool = false

    var body: some View {
       VStack {
          HStack {
             Rectangle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
                .cornerRadius(roundCorners ? 50 : 0)
             Rectangle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
                .cornerRadius(roundCorners ? 50 : 0)
          }.frame(width: 250, height: 120)
          Button("Animate") {
            withAnimation(Animation.easeOut(duration: 2)) {
                self.roundCorners.toggle()
             }
          }
       }.padding()
    }
}

struct Sample1_1_Previews: PreviewProvider {
    static var previews: some View {
        Sample1_1()
    }
}
