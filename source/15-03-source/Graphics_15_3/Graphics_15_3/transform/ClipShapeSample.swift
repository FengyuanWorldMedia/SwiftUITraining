// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct ClipShapeSample: View {
    var body: some View {
        VStack(spacing:50) {
            Image("logo")
               .resizable()
               .frame(width: 200, height: 200)
              
               .border(Color.green, width: 1)
               .clipShape(Circle())
            
            Image("logo")
               .resizable()
               .frame(width: 200, height: 200)
//               .offset(CGSize(width: 50, height: 50))
               .border(Color.green, width: 1)
                .clipShape(Circle())
        }

    }
}

struct ClipShapeSample_Previews: PreviewProvider {
    static var previews: some View {
        ClipShapeSample()
    }
}
