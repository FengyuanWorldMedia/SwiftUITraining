// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct Sample2_1_2View: View {
    @GestureState private var translation = CGSize.zero
    @State private var offset = CGSize.zero

    var body: some View {
       Image("spot1")
          .resizable()
          .scaledToFit()
          .frame(width: 160, height: 200)
          .offset(addToOffset(translation: translation))
          .animation(.linear) // 动作比较丝滑
          .gesture(DragGesture(minimumDistance: 10)
             .updating($translation) { value, state, transaction in
                state = value.translation
             }
             .onEnded { value in
               self.offset = self.addToOffset(translation: value.translation)
             }
          )
    }
    func addToOffset(translation: CGSize) -> CGSize {
       let newOffset = CGSize(width: offset.width + translation.width,
                              height: offset.height + translation.height)
       return newOffset
    }
}

struct Sample2_1_2View_Previews: PreviewProvider {
    static var previews: some View {
        Sample2_1_2View()
    }
}
