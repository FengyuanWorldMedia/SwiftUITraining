// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

/// 11-42
struct Sample2_3_3: View {
    @State private var showInfo = false
    
    var body: some View {
       VStack {
          Button("Show Information") {
             self.showInfo.toggle()
          }.padding()
          if showInfo {
             Text("This is the information")
                .transition(.mytransition)
          }
          Spacer()
       }
    }
}

extension AnyTransition {
   static var mytransition: AnyTransition {
      let animation = Animation.easeInOut(duration: 2)
      let transition = AnyTransition.scale.animation(animation)
      return transition
   }
}

struct Sample2_3_3_Previews: PreviewProvider {
    static var previews: some View {
        Sample2_3_3()
    }
}
