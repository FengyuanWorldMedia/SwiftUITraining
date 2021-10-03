// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct Sample2_3View: View {
    @GestureState private var rotationAngle: Angle = Angle.zero
    @State private var rotation: Angle = Angle.zero

    var body: some View {
       Image("spot1")
          .resizable()
          .scaledToFit()
          .frame(width: 160, height: 200)
          .rotationEffect(rotation + rotationAngle)

          .gesture(RotationGesture()
             .updating($rotationAngle) { value, state, transition in
                state = value
             }
             .onEnded { value in
                self.rotation = self.rotation + value
             }
          )
    }
}

struct Sample2_3View_Previews: PreviewProvider {
    static var previews: some View {
        Sample2_3View()
    }
}
