// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct FrameViewTest: View {
    var body: some View {
        getImage(showType: 4)
    }
}

func getImage(showType : Int) -> some View {
    if showType == 1 {
       return  Image("logo")
                .border(Color.black, width: 3)
                .frame(width: 280, height: 280)
                .border(Color.blue)
    } else if showType == 2 {
        return Image("logo")
                    .border(Color.black, width: 3)
            .frame(width: 280, height: 280, alignment: .topLeading)
                    .border(Color.blue)
   } else if showType == 3 {
        return Image("logo")
                .resizable()
                .border(Color.black, width: 3)
                .frame(width: 280, height: 280)
                .border(Color.blue)
   } else {
        return Image("logo")
                .border(Color.black, width: 3)
                .frame(width: 40, height: 280)
                .border(Color.blue)
   }
}

struct FrameViewTest_Previews: PreviewProvider {
    static var previews: some View {
        FrameViewTest()
    }
}
