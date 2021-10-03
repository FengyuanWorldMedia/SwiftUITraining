// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct Rotation3DEffectTest: View {
    let img = ["logo", "logo", "logo", "logo", "logo"]

       var body: some View {
           ScrollView(.horizontal) {
               LazyHStack(spacing: 0) {
                   ForEach(0..<img.count) { index in
                       GeometryReader { proxy in
                           Image(img[index])
                               .resizable()
                               .aspectRatio(contentMode: .fill)
                               .rotation3DEffect(
                                self.rotateAngle(proxy),
                                axis: (x: 0, y: 11, z: 0))
                       }
                       .frame(width: 600.0 / 3, height: 600.0 / 3 * (425 / 640))
                   }
               }
           }
           .frame(width: 600)
           .coordinateSpace(name: "ScrollViewSpace")
       }

       func rotateAngle(_ proxy: GeometryProxy) -> Angle {
           let dif = 600 * 0.5 - proxy.frame(in: .named("ScrollViewSpace")).midX
           let pct = min(dif / proxy.size.width * 0.5, 1)
           return .degrees(Double(30 * pct))
       }
}

struct Rotation3DEffectTest_Previews: PreviewProvider {
    static var previews: some View {
        Rotation3DEffectTest()
    }
}
