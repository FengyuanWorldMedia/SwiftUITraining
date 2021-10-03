// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct Sample1_2View: View {
    struct ShowImage: View {
       var body: some View {
          Image("spot1")
             .resizable()
             .scaledToFill()
             .edgesIgnoringSafeArea(.all)
       }
    }
    
    @State private var expand: Bool = false
    @State private var pressing: Bool = false

    var body: some View {
        Image("spot1")
           .resizable()
           .scaledToFit()
           .frame(width: 160, height: 200)
           .opacity(pressing ? 0 : 1)
           .animation(.easeInOut(duration: 1.5))
           .onLongPressGesture(minimumDuration: 1, maximumDistance: 10,
              pressing: { value in
                 self.pressing = value
              }, perform: {
                 self.expand = true
           })
           .sheet(isPresented: $expand) {
              ShowImage()
           }
    }
}

struct Sample1_2View_Previews: PreviewProvider {
    static var previews: some View {
        Sample1_2View()
    }
}
