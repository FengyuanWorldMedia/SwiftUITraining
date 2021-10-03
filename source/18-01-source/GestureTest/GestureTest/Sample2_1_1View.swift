// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct Sample2_1_1View: View {
    @GestureState private var offset = CGSize.zero
     
    var body: some View {
       Image("spot1")
          .resizable()
          .scaledToFit()
          .frame(width: 160, height: 200)
          .offset(offset)
          .animation(.linear)
          .gesture(DragGesture(minimumDistance: 10)
             .updating($offset) { currentState, gestureState, transaction in
                // update 不回保存 offset 的状态，结束后回复到 原位
                /// - Parameters:
                ///   - state: A binding to a view's ``GestureState`` property.
                ///   - body: The callback that SwiftUI invokes as the gesture's value
                ///     changes. Its `currentState` parameter is the updated state of the
                ///     gesture. The `gestureState` parameter is the previous state of the
                ///     gesture, and the `transaction` is the context of the gesture.
                print("==offest=========")
                debugPrint(offset)
                debugPrint(currentState)
                debugPrint(gestureState)
                debugPrint(transaction)
                
                gestureState = currentState.translation
                
   
             }
          )
    }
}

struct Sample2_1_1View_Previews: PreviewProvider {
    static var previews: some View {
        Sample2_1_1View()
    }
}
