// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct VStackTest01: View {
    var body: some View {
        // 演示alignment的3个不同参数的效果
        VStack(alignment: .trailing, spacing: 25) {
            HStack {
                VStack(alignment: .trailing) {
                    Text("SwiftUI教学")
                        .border(Color.green, width: 1)
                        
                    Text("丰源天下传媒")
                        .border(Color.red, width: 1)
                }
                Spacer()
            }
            Text("丰源天下传媒--Welcom")
                .border(Color.purple, width: 1)
        }
        .border(Color.pink, width: 1)
        .frame(width: 200, height: 200)
        .background(Color.gray)
    }
}

struct VStackTest01_Previews: PreviewProvider {
    static var previews: some View {
        VStackTest01()
    }
}
