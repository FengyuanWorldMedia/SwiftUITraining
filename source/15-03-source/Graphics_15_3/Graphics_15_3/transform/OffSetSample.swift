// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct OffSetSample: View {
    var body: some View {
        Image("logo")
           .resizable()
           .scaledToFit()
           .frame(width: 200, height: 200)
           .offset(CGSize(width: 50, height: 50))
           .border(Color.green, width: 1)
     }
}

struct OffSetSample_Previews: PreviewProvider {
    static var previews: some View {
        OffSetSample()
    }
}
