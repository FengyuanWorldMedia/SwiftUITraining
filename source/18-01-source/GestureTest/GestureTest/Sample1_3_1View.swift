// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

// 12-4
import SwiftUI

struct Sample1_3_1View: View {
    struct ShowImage: View {
       var body: some View {
          Image("spot1")
             .resizable()
             .scaledToFill()
             .edgesIgnoringSafeArea(.all)
       }
    }
    
    @State private var expand: Bool = false
    @State private var allowExpansion: Bool = false

    var body: some View {
       VStack(spacing: 20) {
          Image("spot1")
             .resizable()
             .scaledToFit()
             .frame(width: 160, height: 200)
             .onTapGesture {
                self.expand = true
             }
             .allowsHitTesting(allowExpansion)
             .sheet(isPresented: $expand) {
                ShowImage()
             }
             Toggle("", isOn: $allowExpansion)
                .labelsHidden()
       }
    }
}

struct Sample1_3_1View_Previews: PreviewProvider {
    static var previews: some View {
        Sample1_3_1View()
    }
}
