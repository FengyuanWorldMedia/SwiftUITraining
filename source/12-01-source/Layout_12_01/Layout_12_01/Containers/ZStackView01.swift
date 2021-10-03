// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct ZStackView01: View {
    var body: some View {
        // 演示alignment的9个不同参数的效果
        ZStack(alignment: .topTrailing) {
            Image("logo")
                .resizable()
                .frame(width: 50, height: 50)
            
            Text("丰源天下传媒")
                .border(Color.black, width: 1)
                .background(Color.blue)
                .zIndex(-1)
        }
        .border(Color.pink, width: 1)
        .frame(width: 200, height: 200)
        .background(Color.gray)
    }
}

struct ZStackView01_Previews: PreviewProvider {
    static var previews: some View {
        ZStackView01()
    }
}
