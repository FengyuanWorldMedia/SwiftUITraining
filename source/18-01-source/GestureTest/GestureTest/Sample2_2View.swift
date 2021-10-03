// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct Sample2_2View: View {
    @GestureState private var magnification: CGFloat = 1
    @State private var zoom: CGFloat = 1

    var body: some View {
       Image("spot1")
          .resizable()
          .scaledToFit()
          .frame(width: 160, height: 200)
          .scaleEffect(zoom * magnification)

          .gesture(MagnificationGesture()
             .updating($magnification) { value, state, transition in
                state = value
             }
             .onEnded { value in
                 self.zoom = self.zoom * value
             }
          )
    }

}

struct Sample2_2View_Previews: PreviewProvider {
    static var previews: some View {
        Sample2_2View()
    }
}
