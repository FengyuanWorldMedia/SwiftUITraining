// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct ScaleSample: View {
    var body: some View {
        VStack (spacing: 50) {
            Image("logo")
               .resizable()
                .border(Color.green, width: 1)
               .frame(width: 100, height: 100)
               .scaleEffect(1.5)
            
            Image("logo")
               .resizable()
               .frame(width: 100, height: 100)
               .border(Color.green, width: 1)
                .scaleEffect(0.75)
            
            Image("logo")
               .resizable()
               .frame(width: 100, height: 100)
               .border(Color.green, width: 1)
               .scaleEffect(CGSize(width: 1.0, height: 1.5))
            
            Image("logo")
               .resizable()
               .frame(width: 100, height: 100)
               .border(Color.green, width: 1)
               .scaleEffect(1.5, anchor: .top)
        }
   
    }
}

struct ScaleSample_Previews: PreviewProvider {
    static var previews: some View {
        ScaleSample()
    }
}
