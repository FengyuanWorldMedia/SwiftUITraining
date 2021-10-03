// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct HStackView01: View {
    var body: some View {
        // 演示alignment的五个不同参数的效果
        HStack(alignment: .bottom) {
            Image("logo")
                .resizable()
                .frame(width: 50, height: 50)
                
//            Text("丰源天下传媒")
//                .border(Color.red, width: 1)
            
            Text("丰源天下传媒 \n hello")
                .border(Color.red, width: 1)
        }
        .border(Color.pink, width: 1)
        .frame(width: 200, height: 200)
        .background(Color.gray)
    }
}

struct HStackView_Previews: PreviewProvider {
    static var previews: some View {
        HStackView01()
    }
}
