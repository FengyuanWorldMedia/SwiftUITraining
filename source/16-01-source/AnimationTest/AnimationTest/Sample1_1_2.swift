// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI
/// 11-34 中断动画效果
struct Sample1_1_2: View {
    @State private var roundCorners: Bool = false
    @State private var active: Bool = false

    var body: some View {
       VStack {
          HStack {
             Rectangle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
                .cornerRadius(roundCorners ? 50 : 0)
                .animation(active ? Animation.default.speed(0.5) : nil)
          }.frame(width: 250, height: 120)
          Button("Animate") {
             self.roundCorners.toggle()
             self.active.toggle()
          }
       }.padding()
    }
}

struct Sample1_1_2_Previews: PreviewProvider {
    static var previews: some View {
        Sample1_1_2()
    }
}
