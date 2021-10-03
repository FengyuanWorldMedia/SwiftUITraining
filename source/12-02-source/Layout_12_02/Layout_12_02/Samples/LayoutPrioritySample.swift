// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct LayoutPrioritySample: View {
    @State private var priority1: Double = 1.0
    @State private var priority2: Double = 2.0
    var body: some View {
        VStack {
            HStack {
                Text("这是一个布局优先级的示例")
                    .lineLimit(1)
                    .layoutPriority(priority1)
    //                .fixedSize()
                Image( "logo")
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                Text("丰源天下传媒有限责任公司")
                    .lineLimit(1)
                    .layoutPriority(priority2)
            }
            Button (action: {
                var temp = self.priority1
                self.priority1 = self.priority2
                self.priority2 = temp
            }, label: {
                Text("change priority")
            })
        }
        
    }
}

struct LayoutPrioritySample_Previews: PreviewProvider {
    static var previews: some View {
        LayoutPrioritySample()
    }
}
